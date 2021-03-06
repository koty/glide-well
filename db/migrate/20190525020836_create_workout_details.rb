class CreateWorkoutDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :workout_details do |t|
      t.references :workout, foreign_key: true, null: false
      t.integer :menu_kind, null: false
      t.integer :times, null: false
      t.decimal :interval, null: false
      t.text :note, null: true
      t.timestamps
    end
  end
end
