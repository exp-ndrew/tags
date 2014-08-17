require 'rspec'
require 'pg'
require 'pry'

require 'item'
require 'tag'
require 'shared'

DB = PG.connect({dbname: 'tag_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM items *;")
    DB.exec("DELETE FROM tags *;")
    DB.exec("DELETE FROM items_tags *;")
  end
end