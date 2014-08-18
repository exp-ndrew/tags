# Tags

A simple tag system to demonstrate a many-to-many relationship through a join table in a SQL database.

## Features

The user can:

* create new items (`Item.new`, `Item.save`)
* create new tags (`Tag.new`, `Tag.save`)
* list all items (`Item.all`, `Item.list`)
* list all tags (`Tag.all`, `Tag.list`)
* assign a tag to an item (`Tag.attach_to(item)`)
* assign an item to a tag (`Item.attach_to(tag)`)
* remove a tag from an item (`Tag.remove_from`); tags with no items are removed automatically
* rename a tag (`Tag.rename`)
* rename an item (`Item.rename`)
* return all the tags assigned to a particular item (`Item.tags`)
* return the items tagged with a particular tag. (`Tag.items`)

Shared methods between both classes:

`self.new`  
`self.save`  
`self.list`  
`self.all`  
`self.rename`  
`self.attach_to(other_class)`  
`self.remove_from(other_class)`  

## Meta

Database Basics assessment for [Epicodus](http://epicodus.com)

16 August 2014

by [Andrew M Westling](http://andrewwestling.com)  
a@andrewwestling.com