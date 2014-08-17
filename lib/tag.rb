require './lib/shared.rb'

class Tag < Shared

  attr_accessor :table, :name, :id
  
  def initialize attributes
    @table = 'tags'
    @name = attributes[:name]
    @id = attributes[:id]
  end

end