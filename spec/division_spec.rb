require('spec_helper')

describe('Division') do
  describe('#employees') do
    it('returns an array of employees with matching division ids') do
      division1 = Division.create({:name=>'Division'})
      employee1 = Employee.create({:name=>'Steve', :division_id=>division1.id})
      employee2 = Employee.create({:name=>'Bob', :division_id=>division1.id})
      expect(division1.employees).to(eq([employee1, employee2]))
    end
  end
end
