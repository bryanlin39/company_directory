require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
require('./lib/division')
require('./lib/employee')
require('./lib/project')
also_reload('lib/**/*.rb')
require('pg')

#all divisions
get('/') do
  @divisions = Division.all
  erb(:index)
end

post('/') do
  Division.create({:name=>params[:div_name]})
  @divisions = Division.all
  erb(:index)
end

#all employees
get('/employees') do
  @employees = Employee.all
  erb(:all_employees)
end

post('/employees') do
  Employee.create({:name => params[:employee_name], :division_id => 0})
  @employees = Employee.all
  erb(:all_employees)
end

# all projects
get('/projects') do
  @projects = Project.all
  erb(:all_projects)
end

post('/projects') do
  Project.create({:name => params[:project_name], :employee_id => 0})
  @projects = Project.all
  erb(:all_projects)
end

# single division
get('/divisions/:div_id') do
  @available_employees = Employee.available
  @division = Division.find(params[:div_id].to_i)
  erb(:one_division)
end

patch('/divisions/:id/remove') do
  @division = Division.find(params[:id].to_i)
  @division.remove_employees(params[:employee_ids])
  @available_employees = Employee.available
  erb(:one_division)
end

patch('/divisions/:id/add') do
  @division = Division.find(params[:id].to_i)
  @division.add_employees(params[:employee_ids])
  @available_employees = Employee.available
  erb(:one_division)
end

# single employee
get('/employees/:employee_id') do
  @available_projects = Project.available
  @employee = Employee.find(params[:employee_id].to_i)
  erb(:one_employee)
end

patch('/employees/:id/remove') do
  @employee = Employee.find(params[:id].to_i)
  @employee.remove_projects(params[:project_name])
  @available_projects = Project.available
  erb(:one_employee)
end

patch('/employees/:id/add') do
  @employee = Employee.find(params[:id].to_i)
  @employee.add_projects(params[:project_name])
  @available_projects = Project.available
  erb(:one_employee)
end
