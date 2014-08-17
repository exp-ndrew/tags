require './lib/shared.rb'

class Item < Shared
  
  attr_accessor :table, :name, :id
  
  def initialize attributes
    @table = 'items'
    @name = attributes[:name]
    @id = attributes[:id]
  end


end