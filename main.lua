require 'company'
require 'department'
require 'employee'

-- Setup company
local comp = Company('101Companies.org')

-- Setup department 1
local dep1 = Department('Dep 1')
local man1 = Employee('Foo Bar', 'Foo Street 1', 100.5)
dep1:setManager(man1)

local emp1_1 = Employee('Emp1_1', 'Emp Street 1', 63)
dep1:addEmployee(emp1_1)
local emp1_2 = Employee('Emp1_2', 'Emp Street 2', 92)
dep1:addEmployee(emp1_2)

comp:addDepartment(dep1)

-- Setup SubDepartment 1_1
local subDep1 = Department('SubDep 1_1')
local subMan1 = Employee('Sub Man 1', 'Foo Street 2', 215)
subDep1:setManager(subMan1)

local subEmp1_1 = Employee('SubEmp1_1', 'Emp Street 3', 128)
subDep1:addEmployee(subEmp1_1)

dep1:addSubDepartmnt(subDep1)

-- Setup Dep 2
local dep2 = Department('Dep 2')
local man2 = Employee('Dep2 Man', 'Dep Street 1', 941)
dep2:setManager(man2)

local emp2_1 = Employee('Emp2_1', 'Emp Street 5', 512)
dep2:addEmployee(emp2_1)
local emp2_2 = Employee('Emp2_2', 'Emp Street 10', 851)
dep2:addEmployee(emp2_2)

comp:addDepartment(dep2)


print("Total: " .. comp:total())
print("Median: " .. comp:median())
print("Number of Employees: " .. comp:numEmployees())
print("Cut: " .. comp:total(comp:cut()))
print("Median: " .. comp:median())
print("Depth of Dep 1: " .. dep1:depth())
print("Depth of Dep 2: " .. dep2:depth())