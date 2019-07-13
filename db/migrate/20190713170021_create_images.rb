class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.text :caption
      t.string :subtitle
      t.integer :user_id
      t.integer :place_id
      t.timestamps
    end

    add_index :images, [:user_id, :place_id]
    add_index :images, :place_id
  end
end
