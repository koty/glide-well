class WorkoutDetailChangeIntervalType < ActiveRecord::Migration[5.2]
  def change
    change_column :workout_details, :interval, :integer
  end
end
