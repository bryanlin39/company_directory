class Project < ActiveRecord::Base
  belongs_to(:employee)

  scope(:available, -> do
    where({:employee_id => 0})
  end)


end
