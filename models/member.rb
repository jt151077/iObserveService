# Class used to hold bookmarking logic
require 'rubygems'
require 'mongoid'

class Member
  include Mongoid::Document
  store_in :members
  field :genre, :type => String
  field :buid, :type => String
  field :age, :type => String
  field :origin, :type => String
  field :otext, :type => String
  field :color, :type => String
  field :artefacts, :type => String
end
