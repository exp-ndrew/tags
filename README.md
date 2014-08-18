# Tags

A simple tag system to demonstrate a many-to-many relationship through a join table in a SQL database.

## Features

The user can:

* create new items (`Item.new`, `Item.save`) [WORKING]
* create new tags (`Tag.new`, `Tag.save`) [WORKING]
* list all items (`Item.all`, `Item.list`) [WORKING]
* list all tags (`Tag.all`, `Tag.list`) [WORKING]
* assign a tag to an item (`Tag.attach_to(item)`) [WORKING]
* assign an item to a tag (`Item.attach_to(tag)`) [WORKING]
* remove an item from the collection (`Item.remove`); [WORKING]
  * implicitly remove the removed item's tag associations
* remove a tag from an item (`Tag.remove_from`); [WORKING]
  * tags with no items are removed automatically
* list all tags currently assigned to an item (`Item.list_tags`)  [WORKING]
* rename a tag (`Tag.rename`)
* rename an item (`Item.rename`)
* return all the tags assigned to a particular item (`Item.tags`)  [WORKING]
* return the items tagged with a particular tag. (`Tag.items`)  [WORKING]

Shared methods between both classes:

`self.new`  
`self.save`  
`self.list`  
`self.all`  
`self.rename`  
`self.search_by_name`  


## Issues

* duplicates exist on join table when a tag/item is assigned to an item/tag multiple times


## Meta

Database Basics assessment for [Epicodus](http://epicodus.com)

16 August 2014

by [Andrew M Westling](http://andrewwestling.com)  
a@andrewwestling.com