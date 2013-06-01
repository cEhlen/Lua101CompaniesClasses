Headline
========

Lua implementation using a basic class system.

Characteristics
===============

This implementation shows how a class system in Lua could be implemented. This 
system used here is a very basic one, which supports only limited features.
The supported features are derivation and a "is_a" function to check if a given
table is a subclass or the class of class.

Illustration
============

To define a class we use a function called _class_ and pass a constructor.
```lua
Company = class(function ( c, name, departments )
  c.name = name
  c.departments = departments or {}
end)
```
This creates a class named _Company_ and we can create instances of this class 
using the table now stored inside the _Company_ variable. We save this inside
the global scope so we can access it easily after we imported the file.

```lua
local comp = Company('101Companies.org')
```
Now _comp_ is an instance of the Company class and can be used to call the
previously defined methods.

Architecture
============

- main.lua - The entry point, which initializes the company.
- class.lua - Our class system. 
- department.lua / employee.lus / company.lua - The classes for the given object

Usage
=====

You need [Lua 5.1](http://www.lua.org) or [LuaJIT](http://luajit.org/) to run 
the example. If you have one of the above installed just use it to run the 
_main.lua_ file.
```shell
luajit main.lua
lua main.lua
```
