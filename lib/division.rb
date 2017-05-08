class Division < ActiveRecord::Base
  has_many(:employees)

  def add_employees(id_array)
    id_array.each do |id|
      found_employee = Employee.find(id.to_i)
      found_employee.update({:division_id=>self.id})
    end
  end

  def remove_employees(id_array)
    id_array.each do |id|
      found_employee = Employee.find(id.to_i)
      found_employee.update({:division_id=>0})
    end
  end
end
