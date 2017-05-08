require('spec_helper')

describe('Employee') do
  describe('#division') do
    it('returns the division employee is assigned to') do
      division1 = Division.create({:name=>'Division'})
      employee1 = division1.employees.create({:name=>'Steve'})
      expect(employee1.division).to(eq(division1))
    end
  end
end
