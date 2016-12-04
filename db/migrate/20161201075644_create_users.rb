class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :gender
      t.date :date_of_birth
      t.boolean :is_admin, default: false
         
      t.timestamps
    end
  end
end
