class CreateUsersStacks < ActiveRecord::Migration[5.1]
  def change
    create_table :stacks_users do |t|
      t.belongs_to :user
      t.belongs_to :stack
    end
  end
end
