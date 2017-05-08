class CreateDivisionsAndEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table(:divisions) do |table|
      table.column(:name, :string)
    end
    create_table(:employees) do |table|
      table.column(:name, :string)
      table.column(:division_id, :integer)      
    end
  end
end
