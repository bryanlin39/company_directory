require('spec_helper')

describe(Project) do
  describe('#employee') do
    it('returns the employee that the project is assigned to') do
      employee1 = Employee.create({:name => 'Jon'})
      project1 = employee1.projects().create({:name => 'Project1'})
      expect(project1.employee()).to eq(employee1)
    end
  end
end
