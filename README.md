# Tags

A simple tag system I built to demonstrate a many-to-many relationship through a join table in a SQL database.

## Features

The user can:

* create new items (`Item.new`, `Item.save`)
* create new tags (`Tag.new`, `Tag.save`)
* list all items (`Item.all`, `Item.list`)
  * see from the item list which tags an item has
* list all tags (`Tag.all`, `Tag.list`)
  * see from the tag list which items are assigned to each tag
* assign a tag to an item (`Tag.attach_to(item)`)
* assign an item to a tag (`Item.attach_to(tag)`)
* remove an item from the collection (`Item.remove`);
  * implicitly remove the removed item's tag associations
* globally remove a tag from all items it is associated with (`Tag.remove`)
* remove a tag from an individual item (`Tag.remove_from(item)`);
  * purge unused tags from the collection (`Tag.purge_unused`) **(WIP)**
* list all tags currently assigned to an item (`Item.list_tags`) 
* rename a tag (`Tag.rename`)
* rename an item (`Item.rename`)
* return all the tags assigned to a particular item (`Item.tags`) 
* return the items tagged with a particular tag. (`Tag.items`) 

Shared methods between both classes:

`self.save`  
`self.list`  
`self.all`  
`self.rename`  
`self.search_by_name`  


## Issues

* duplicates exist on join table when a tag/item is assigned to an item/tag multiple times

## In Progress

* implement a `find_or_create` method for adding tags; user simply enters the name of the tag they wish to assign and the method either finds the existing tag with the given name, or it creates a tag with the given name if one doesn't exist.
* implement a `Tag.purge_unused` method for removing tags that have no items associated with them
* refactor the UI so the menu options is clearer
* allow user to assign multiple tags at once (input separated by commas)
* show tags assigned to each item in the item list
* show items assigned to each tag in the tag list

## Meta

Database Basics assessment for [Epicodus](http://epicodus.com)

16 August 2014

by [Andrew M Westling](http://andrewwestling.com)  
a@andrewwestling.com