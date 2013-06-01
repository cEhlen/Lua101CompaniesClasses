-- This is a real basic implementation of a class system.
-- To see more information about it have a look at 
-- http://lua-users.org/wiki/SimpleLuaClasses

-- We make use of dynamic parameter so you can decide if you want to derivate
-- from a base class by passing a table the first parameter and a function as 
-- second. If we don't want a parent class just pass a function as first 
-- parameter
function class ( base, init )
  local c = {}
  if not init and type(base) == 'function' then
    init = base
    base = nil
  elseif type(base) == 'table' then
    -- We copy the base class
    for k,v in pairs(base) do
      c[k] = v
    end
    c._base = base
  end

  c.__index = c

  local mt = {}
  mt.__call = function ( class_tbl, ... )
    local obj = {}
    setmetatable(obj, c)
    if init then
      init(obj, ...)
    elseif base and base.init then
      base.init(obj, ...)
    end
    return obj
  end

  c.init = init
  c.is_a = function ( self, klass )
    local m = getmetatable(self)
    while m do
      if m == klass then return true end
      m = m._base
    end
    return false
  end

  setmetatable(c, mt)
  return c
end