require 'rubygems'
require 'active_support/core_ext/string/inflections'

require 'pg'
require 'pry'


class Shared

  def self.all
    table_name = self.to_s.downcase.pluralize
    from_db = DB.exec("SELECT * FROM #{table_name};")
    all_objects = []
    from_db.each do |object|
      name = object['name']
      id = object['id'].to_i
      new_object = self.new({:name => name, :id => id})
      all_objects << new_object
    end
    all_objects
  end

  def self.list
    table_name = self.to_s.downcase.pluralize
    from_db = DB.exec("SELECT * FROM #{table_name};")
    all_names = []
    from_db.each do |object|
      all_names << object['name']
    end
    all_names
  end

  def self.search_by_name name
    #required by the assign_to method
    self.all.find { |object| object.name == name}
  end

  def save
    save = DB.exec("INSERT INTO #{self.table} (name) VALUES ('#{self.name}') RETURNING id;")
    @id = save.first['id'].to_i
  end

  def == another_object
    self.name == another_object.name
  end




end