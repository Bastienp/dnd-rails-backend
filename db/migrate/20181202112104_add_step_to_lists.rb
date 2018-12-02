class AddStepToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :step, :string
  end
end
