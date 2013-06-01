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
  self.salary = self.salary / 2
end