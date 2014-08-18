require './lib/shared.rb'

class Item < Shared
  
  attr_accessor :table, :name, :id, :tags

  def initialize attributes
    @table = 'items'
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def assign_to tag
    #Item.assign_to(tag_name)
    DB.exec("INSERT INTO items_tags (item_id, tag_id) VALUES (#{self.id}, #{tag.id});")
  end

  def tags
    #lists the tags assigned to a particular item
    found = []
    tags = DB.exec("SELECT * FROM items_tags WHERE item_id = '#{@id}';")
    tags.each do |tag|
      tag_id = tag['tag_id']
      matches_in_tag_table = DB.exec("SELECT * FROM tags WHERE id = '#{tag_id}'")
      matches_in_tag_table.each do |match|
        name = match["name"]
        id = match["id"].to_i
        found << Tag.new({name: name, id: id})
      end
    end
    found
  end

end