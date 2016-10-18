class Lists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :title, null: false
      t.string :description
      t.timestamps
    end
  end
end
