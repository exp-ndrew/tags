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
  when '4'
    list_tags
  when '5'
    item_to_tag
  when '6'
    tag_to_item
  when 'x'
    puts "Bye!"
    exit
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
  puts Item.list
  ws
  puts 'Press any key to return'
  gets.chomp
  main_menu

end

def list_tags
  ws
  puts 'Here are the tags in your collection:'
  puts Tag.list
  ws
  puts 'Press any key to return'
  gets.chomp
  main_menu
end

def tag_to_item
  # assign a tag to an item
  # Tag.assign_to(item)
end

def item_to_tag
  # assign an item to a tag
  # Item.assign_to(tag)
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