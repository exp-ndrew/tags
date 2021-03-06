require 'pg'
require './lib/item.rb'
require './lib/tag.rb'

DB = PG.connect({dbname: 'tag'})

def main_menu

  header

  puts "Items Menu:"
  ws
  puts "1 > New Item"
  puts "2 > List All Items"
  puts "3 > Remove Item from Collection"
  puts "4 > Rename Item"
  ws
  puts "Tags Menu:"
  ws
  puts "5 > New Tag"
  puts "6 > List All Tags"
  puts "7 > Rename Tag"
  puts "8 > Assign Tag to Item"
  puts "9 > Remove Tag from Item"
  puts "10 > Remove Tag from Collection"
  ws
  puts "X > Exit"

  input = gets.chomp

  case input
  when '1'
    new_item
  when '2'
    list_items
    ws
    puts 'Press any key to return'
    gets.chomp
    main_menu
  when '3'
    remove_item_from_collection
  when '4'
    rename_item
  when '5'
    new_tag
  when '6'
    list_tags
    ws
    puts 'Press any key to return'
    gets.chomp
    main_menu
  when '7'
    rename_tag
  when '8'
    tag_to_item
  when '9'
    remove_tag_from_item
  when '10'
    remove_tag_from_collection
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
  Item.all.each do |item|
    puts item.name
    ws
    item.tags.each { |x| puts "\s\s\s(#{x.name})" + "\n" }
    ws
    puts "============"
  end
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

  puts "The tag '#{tag.name}' was successfully assigned to '#{item.name}!'"
  wait
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

  puts "'#{item.name}' is now tagged '#{tag.name}!'"
  wait
  wait
  main_menu
end

def remove_item_from_collection
  #delete an item from the items table
  #delete rows in items_tags table where the item is referenced
  ws
  list_items
  ws
  puts 'Enter the name of the item to delete:'
  item_name = gets.chomp

  # ADD VALIDATION to check if the item_name exists in the table
  ws
  puts "Are you sure you want to delete the item '#{item_name}?'"
  puts "Enter y/n:"
  loop do
    confirm = gets.chomp
    case confirm
    when 'y'
      item = Item.search_by_name(item_name)
      item.remove
      puts "#{item_name} has been successfully removed from the collection!"
      wait
      wait
      main_menu
    when 'n'
      puts "No items were removed from the collection."
      wait
      wait
      main_menu
    else
      puts "Please enter 'y' for yes or 'n' for no:"
      redo
    end
  end
end

def remove_tag_from_collection
  #delete an tag from the tags table
  #delete rows in items_tags table where the tag is referenced
  ws
  list_tags
  ws
  puts 'Enter the name of the tag to delete:'
  tag_name = gets.chomp

  # ADD VALIDATION to check if the tag_name exists in the table
  ws
  puts "Are you sure you want to delete the tag '#{tag_name}?'"
  puts "(Items with this tag will remain, but the tag will be dissociated from them.)"
  puts "Enter y/n:"
  loop do
    confirm = gets.chomp
    case confirm
    when 'y'
      tag = Tag.search_by_name(tag_name)
      tag.remove
      puts "#{tag_name} has been successfully removed from the collection!"
      wait
      wait
      main_menu
    when 'n'
      puts "No tags were removed from the collection."
      wait
      wait
      main_menu
    else
      puts "Please enter 'y' for yes or 'n' for no:"
      redo
    end
  end
end

def remove_tag_from_item
  ws
  list_items
  ws
  puts 'Enter the name of the item from which you would like to remove a tag:'
  item_name = gets.chomp
  
  ws
  # ADD VALIDATION to check if the item_name exists in the table
  puts "#{item_name} selected"

  item = Item.search_by_name(item_name)

  puts "#{item_name}'s current tags:"
  puts item.list_tags

  puts "Enter the tag you wish to remove from #{item_name}"
  tag_name = gets.chomp

  tag = Tag.search_by_name(tag_name)

  tag.remove_from(item)

  puts "#{item_name} has been untagged '#{tag_name}!'"
  wait
  wait
  main_menu
end

def rename_item
  ws
  list_items
  ws

  puts "Type the name of the tag to rename:"
  item_name = gets.chomp

  # ADD VALIDATION to check if the item_name exists in the table
  ws
  puts "Enter a new name for #{item_name}:"
  new_name = gets.chomp

  item = Item.search_by_name(item_name)
  item.rename(new_name)

  puts "'#{item_name} was renamed to '#{new_name}!'"
  wait
  wait
  main_menu
end

def rename_tag
  ws
  list_tags
  ws
  puts "Type the name of the tag to rename:"
  tag_name = gets.chomp

  # ADD VALIDATION to check if the item_name exists in the table
  ws
  puts "Enter a new name for #{tag_name}:"
  new_name = gets.chomp

  tag = Tag.search_by_name(tag_name)
  tag.rename(new_name)

  puts "'#{tag_name} was renamed to '#{new_name}!'"
  wait
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