class ChangeKindTypeToString < ActiveRecord::Migration[5.2]
  def change
    change_column :workouts, :kind, :string
  end
end
