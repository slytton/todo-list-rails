class SwitchForeignKeysTodosLists < ActiveRecord::Migration[5.0]
  def up
    change_column :todos, :done, :boolean, default: false, null: false
    add_reference :todos, :list, foreign_key: true
  end
  def down
    change_column :todos, :done, :boolean, default: nil, null: true
    remove_reference :todos, :list
  end
end
