class CreateFitnesses < ActiveRecord::Migration[6.0]
  def change
    create_table :fitnesses do |t|
      t.text       :title,       null: false
      t.text       :info,        null: false
      t.integer    :category_id, null: false
      t.integer    :level_id,    null: false
      t.references :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
