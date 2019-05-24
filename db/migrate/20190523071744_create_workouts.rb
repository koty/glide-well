class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.references :user, foreign_key: true, null: false
      t.date :date, :null => false
      t.integer :kind, :null => false
      t.timestamp :timestamps, :null => false
    end
  end
end
