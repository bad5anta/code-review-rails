class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.text :stack, array: true, default: []
      t.integer :role
      t.string :label

      t.timestamps
    end
  end
end
