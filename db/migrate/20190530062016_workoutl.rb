class Workoutl < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :impression, :text
  end
end
