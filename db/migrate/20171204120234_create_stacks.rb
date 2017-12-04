class CreateStacks < ActiveRecord::Migration[5.1]
  def change
    create_table :stacks do |t|
      t.string :name
      t.string :icon
    end
  end
end
