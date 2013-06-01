require 'class'
require 'department'

Company = class(function ( c, name, departments )
  c.name = name
  c.departments = departments or {}
end)

-- Here we just want to calculate the total of all departments
function Company:total (  )
  local t = 0
  for _,v in pairs(self.departments) do
    t = t + v:total()
  end
  return t
end

-- Just cut the departments
function Company:cut (  )
  for _,v in pairs(self.departments) do
    v:cut()
  end
end

function Company:addDepartment( dep )
  --table_print(getmetatable(dep))
  if dep.is_a and dep:is_a(Department) then
    self.departments[dep.name] = dep
  else
    print('You can only add departments to the company.')
  end
end