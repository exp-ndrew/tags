require 'spec_helper'

describe Tag do 
  it 'creates a new tag in the tags table' do
    new_tag = Tag.new({name: 'color'})
    new_tag.save
    expect(Tag.all).to eq [new_tag]
  end
  it 'returns a list of all tag names' do
    new_tag1 = Tag.new({name: 'color'})
    new_tag2 = Tag.new({name: 'shape'})
    new_tag1.save
    new_tag2.save
    expect(Tag.list).to eq [new_tag1.name, new_tag2.name]
  end
end