require 'spec_helper'

describe Item do 
  it 'creates a new item in the item table' do
    new_item = Item.new({name: 'Red'})
    new_item.save
    expect(Item.all).to eq [new_item]
  end
  
end