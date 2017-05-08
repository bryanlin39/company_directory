ENV['RACK_ENV'] = 'test'
require('rspec')
require('pg')
require("sinatra/activerecord")
require('./lib/employee')
require('./lib/division')
require('./lib/project')

RSpec.configure do |config|
  config.after(:each) do
    Division.all.each do |division|
      division.destroy
    end
    Employee.all.each do |employee|
      employee.destroy
    end
    Project.all.each do |project|
      project.destroy
    end
  end
end
