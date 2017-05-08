class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table(:projects) do |table|
      table.column(:name, :string)
      table.column(:employee_id, :integer)
    end
  end
end
