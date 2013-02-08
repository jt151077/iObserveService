require 'rubygems'
require 'sinatra'
require 'mongoid'
require 'digest'
require 'fileutils'

Dir["./models/*.rb"].each {|file| require file }
configure do
   Mongoid.configure do |config|
    name = "munchobserver_app"
    host = "localhost"
    config.master = Mongo::Connection.new.db(name)
  end
end

# show default page home
get '/' do
  send_file File.join('public', 'index.html')
end

get '/servicetest' do
  return { :status => "success"}.to_json
end

# post a spot
post '/spots' do
	spot = Spot.create(:created_at => params[:date],
						:timestp => params[:timestp],
						:buid => params[:buid],
						:color => params[:color],
						:xcoord => params[:xcoord],
						:ycoord => params[:ycoord],
						:enotes => params[:enotes],
						:actions => params[:actions])

	return spot.to_json
end

# post a member
post '/members' do
	member = Member.create(:genre => params[:genre],
						:buid => params[:buid],
						:age => params[:age],
						:origin => params[:origin],
						:otext => params[:otext],
						:color => params[:color],
						:artefacts => params[:artefacts])
	return member.to_json
end

# post a note
post '/notes' do
	note = Note.create(:content => params[:content],
						:buid => params[:buid])
	return note.to_json
end

# post a note
post '/sessions/:id/:room/:t' do
	sessionobj = Session.create(:sessionid => params[:id],
								:room => params[:room],
								:ellapsed => params[:t])
	return sessionobj.to_json
end

# get sessions ids
get '/sessions/:t' do
    @sessions = Session.order_by([:sessionid, :desc])
    return @sessions.to_json
end 

# post a picture
post '/upload' do
 	tempfile = params['file'][:tempfile]
  	filename = params['file'][:filename]
  	filename = File.join("files", filename)
  	File.open(filename, 'wb') do |file|
  		file.write(tempfile.read)
  	end
  	return { :status => "success", :fileSaved => filename}.to_json
end

get '/picture/:id' do
	send_file File.join("files", params[:id])
end


post '/postits' do
	content_type :json
	return { :status => "success"}.to_json
end

get '/postits' do
	return [{:id => "1",
:owner => "jeremyt",
:xpos => "10",
:ypos => "20",
:scene => "simulation1",
:content => "this is sweet"},{:id => "2",
:owner => "jeremyt",
:xpos => "40",
:ypos => "50",
:scene => "simulation1",
:content => "this is awesome"}].to_json
end