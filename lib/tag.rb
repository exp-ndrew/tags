require './lib/shared.rb'

class Tag < Shared

  attr_accessor :table, :name, :id, :items

  def initialize attributes
    @table = 'tags'
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def assign_to item
    #tag.assign_to(item)
    DB.exec("INSERT INTO items_tags (tag_id, item_id) VALUES (#{self.id}, #{item.id});")
  end

  def remove_from item
    #tag.remove_from(item)
    DB.exec("DELETE FROM items_tags WHERE tag_id = #{self.id} AND item_id = #{item.id};")
  end

  def items
    #lists the items assigned to a particular tag
    found = []
    items = DB.exec("SELECT * FROM items_tags WHERE tag_id = '#{@id}';")
    items.each do |item|
      item_id = item['item_id']
      matches_in_item_table = DB.exec("SELECT * FROM items WHERE id = '#{item_id}';")
      matches_in_item_table.each do |match|
        name = match["name"]
        id = match["id"].to_i
        found << Item.new({name: name, id: id})
      end
    end
    found
  end

end