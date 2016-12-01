class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :quality
      t.integer :singer_id
      t.integer :album_id
      t.string :album_type
      t.integer :composer_id
      t.integer :category_id
      t.integer :views
      t.float :avg_rates
      t.boolean :pinned

      t.timestamps
    end
  end
end
