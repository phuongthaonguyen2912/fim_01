class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :gender
      t.date :date_of_birth
      t.integer :type_of_music
      t.string :type

      t.timestamps
    end
  end
end
