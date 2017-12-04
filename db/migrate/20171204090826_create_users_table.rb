class CreateUsersTable < ActiveRecord::Migration[5.1]
  def change
    create_table :users_tables do |t|
      t.string :email
      t.string :name
      t.text :stack, array:true, default: []
      t.string :role
      t.string :label
    end
  end
end
