# Class used to hold bookmarking logic
require 'rubygems'
require 'mongoid'

class Note
  include Mongoid::Document
  store_in :notes
  field :content, :type => String
  field :buid, :type => String
end
