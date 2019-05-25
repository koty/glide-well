class WorkoutDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :workout_details, :distance, :integer
  end
end
