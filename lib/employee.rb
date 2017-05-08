class Employee < ActiveRecord::Base
  belongs_to(:division)

  has_many(:projects)

  scope(:available, -> do
    where({:division_id => 0})
  end)

  def add_projects(id_array)
    id_array.each do |id|
      found_project = Project.find(id.to_i)
      found_project.update({:employee_id=>self.id})
    end
  end

  def remove_projects(id_array)
    id_array.each do |id|
      found_project = Project.find(id.to_i)
      found_project.update({:employee_id=>0})
    end
  end
end
