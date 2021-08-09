class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.references :users, null: false
      t.integer :partner_id, null: false 
      t.string :sentence, null: false
      t.timestamps
    end
  end
end
