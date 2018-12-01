class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :job
      t.references :list, foreign_key: true, index: true

      t.timestamps
    end
  end
end
