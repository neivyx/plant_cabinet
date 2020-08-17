class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :description
      t.string :location
      t.string :light_requirement
      t.string :watering
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
