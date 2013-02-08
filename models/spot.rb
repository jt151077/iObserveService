# Class used to hold bookmarking logic
require 'rubygems'
require 'mongoid'

class Spot
  include Mongoid::Document
  store_in :spots
  field :created_at, :type => String
  field :timestp, :type => String
  field :buid, :type => String
  field :color, :type => String
  field :xcoord, :type => String
  field :ycoord, :type => String
  field :enotes, :type => String
  field :actions, :type => String
end
