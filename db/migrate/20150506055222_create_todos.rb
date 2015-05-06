class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.boolean :is_completed
      t.references :list, index: true, foreign_key: true
      t.date :due_date
      t.string :description

      t.timestamps null: false
    end
  end
end
