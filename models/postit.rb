# Class used to hold bookmarking logic
require 'rubygems'
require 'mongoid'

class Postit
  include Mongoid::Document
  store_in :postits
  field :bid, :type => String
  field :owner, :type => String
  field :xpos, :type => String
  field :ypos, :type => String
  field :scene, :type => String
  field :content, :type => String
end
