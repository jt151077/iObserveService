# Class used to hold bookmarking logic
require 'rubygems'
require 'mongoid'

class Session
  include Mongoid::Document
  store_in :sessions
  field :sessionid, :type => String
  field :room, :type => String
  field :ellapsed, :type => String
end
