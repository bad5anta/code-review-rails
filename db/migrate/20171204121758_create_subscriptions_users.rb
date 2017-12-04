class CreateSubscriptionsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions_users do |t|
      t.references :user, foreign_key: true
      t.references :subscriber, foreign_key: { to_table: :users }
      t.references :stack, foreign_key: true
      t.integer :kind

      t.timestamps
    end
  end
end
