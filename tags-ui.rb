require 'pg'
require './lib/item.rb'
require './lib/tag.rb'

DB = PG.connect({dbname: 'tag'})

def main_menu

  header

  puts "1 > New Item"
  puts "3 > List All Items"
  puts "5 > Assign Item to Tag"
  puts "2 > New Tag"
  puts "4 > List All Tags"
  puts "6 > Assign Tag to Item"
  puts "X > Exit"

  input = gets.chomp

  case input
  when '1'
    new_item
  when '2'
    new_tag
  when '3'
    list_items
    ws
    puts 'Press any key to return'
    gets.chomp
    main_menu
  when '4'
    list_tags
    ws
    puts 'Press any key to return'
    gets.chomp
    main_menu
  when '5'
    item_to_tag
  when '6'
    tag_to_item
  when 'x'
    puts "Bye!"
    exit
  else
    puts "Please enter a valid input."
    wait
    main_menu
  end

end

def new_item
  ws
  puts 'Enter the new item name:'
  input = gets.chomp
  item = Item.new({name: "#{input}"})
  item.save
  puts "#{input} item created!"
  wait
  main_menu

end

def new_tag
  ws
  puts 'Enter the new tag name:'
  input = gets.chomp
  tag = Tag.new({name: "#{input}"})
  tag.save
  puts "#{input} tag created!"
  wait
  main_menu
end

def list_items
  ws
  puts 'Here are the items in your collection:'
  ws
  puts Item.list
end

def list_tags
  ws
  puts 'Here are the tags in your collection:'
  ws
  puts Tag.list
end

def tag_to_item
  # assign a tag to an item
  # Tag.assign_to(item)
  ws
  list_items
  ws
  puts 'Enter the name of the item to which you want to assign a tag:'
  item_name = gets.chomp
  ws
  # ADD VALIDATION to check if the item_name exists in the table
  puts "#{item_name} selected"
  ws
  list_tags
  ws

  puts "Enter the tag you want to assign to #{item_name}:"
  tag_name = gets.chomp

  tag = Tag.search_by_name(tag_name)
  item = Item.search_by_name(item_name)

  tag.assign_to(item)

  puts "#{tag.name} successfully assigned to #{item.name}!"
  wait
  main_menu
end

def item_to_tag
  # assign an item to a tag
  # Item.assign_to(tag)

  ws
  list_tags
  ws
  puts 'Enter the name of the tag to which you want to assign a item:'
  tag_name = gets.chomp
  ws
  # ADD VALIDATION to check if the tag_name exists in the table
  puts "#{tag_name} selected"
  ws
  list_items
  ws

  puts "Enter the item you want to assign to #{tag_name}:"
  item_name = gets.chomp

  tag = Tag.search_by_name(tag_name)
  item = Item.search_by_name(item_name)

  item.assign_to(tag)

  puts "#{tag.name} successfully assigned to #{item.name}!"
  wait
  main_menu
end


## UI HELPER THINGS ##

def header
  system('clear')
end

def ws
  puts "\n"
end

def wait
  sleep(0.5)
end

main_menu