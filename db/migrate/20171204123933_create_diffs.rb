class CreateDiffs < ActiveRecord::Migration[5.1]
  def change
    create_table :diffs do |t|
      t.jsonb :code_changes
      t.string :status, default: 'new'

      t.belongs_to :author, foreign_key: { to_table: :users }
      t.belongs_to :reviewer, foreign_key: { to_table: :users }
      t.belongs_to :stack
    end
  end
end
