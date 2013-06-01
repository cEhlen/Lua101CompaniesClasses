require 'class'
require 'employee'

Department = class(function ( d, name, subDeps, man, emp )
  d.name = name
  d.subDepartments = subDeps or {}
  d.manager = man
  d.employees = emp or {}
end)

-- Just go through all sub deparments and employees and get their total
-- and sum the returned values up.
function Department:total (  )
  local t = self.manager:total()
  for _,v in pairs(self.subDepartments) do
    t = t + v:total()
  end
  for _,v in pairs(self.employees) do
    t = t + v:total()
  end
  return t
end

-- Iterate through the departments and employees again and cut their salary in
-- half.
function Department:cut (  )
  self.manager:cut()
  for _,v in pairs(self.subDepartments) do
    v:cut()
  end
  for _,v in pairs(self.employees) do
    v:cut()
  end
end

function Department:depth(  )
  local tDepth = 0
  if next(self.subDepartments) == nil then
    tDepth = 1
  else
    for _,v in pairs(self.subDepartments) do
      local subDepDepth = v:depth()
      if subDepDepth > tDepth then
        tDepth = subDepDepth
      end
    end
    tDepth = tDepth + 1
  end
  return tDepth
end

function Department:numEmployees (  )
  local t = 1
  for _,v in pairs(self.subDepartments) do
    t = t + v:numEmployees()
  end
  for _,v in pairs(self.employees) do
    t = t + 1
  end
  return t
end

-- Below are a few basic setters. Here we just do a check if we only add classes
-- of the right "type" to show of our class.is_a functionality.

function Department:setManager ( man )
  if man.is_a and man:is_a(Employee) then
    self.manager = man
  else
    print('You can only add an employee as a manager.')
  end
end

function Department:addEmployee ( emp )
  if emp.is_a and emp:is_a(Employee) then
    self.employees[emp.name] = emp
  else
    print('You can only add an employee as a employee.')
  end
end

function Department:addSubDepartmnt ( dep )
  if dep.is_a and dep:is_a(Department) then
    self.subDepartments[dep.name] = dep
  else
    print('You can only add an employee as a employee.')
  end
end