require 'spec_helper'

describe Item do 
  it 'creates a new item in the items table' do
    new_item = Item.new({name: 'Red'})
    new_item.save
    expect(Item.all).to eq [new_item]
  end
  it 'returns a list of all item names' do
    new_item1 = Item.new({name: 'Red'})
    new_item2 = Item.new({name: 'Blue'})
    new_item1.save
    new_item2.save
    expect(Item.list).to eq [new_item1.name, new_item2.name]
  end
end