require 'spec_helper'

describe Tag do 
  it 'creates a new tag in the tags table' do
    new_tag = Tag.new({name: 'color'})
    new_tag.save
    expect(Tag.all).to eq [new_tag]
  end
  
end