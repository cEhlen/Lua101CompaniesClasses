require 'class'

Employee = class(function ( e, name, adress, salary )
  e.name = name
  e.adress = adress
  e.salary = salary
end)

function Employee:total (  )
  return self.salary
end

function Employee:cut (  )
  local log = 'Salary of employee ' .. self.name .. ' changed to '
  self.salary = self.salary / 2
  log = log .. self.salary
  print(log)
end