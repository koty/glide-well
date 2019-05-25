# == Schema Information
#
# Table name: workout_details
#
#  id         :bigint           not null, primary key
#  workout_id :bigint           not null
#  menu_kind  :integer          not null
#  times      :integer          not null
#  interval   :decimal(, )      not null
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  distance   :integer
#

class WorkoutDetail < ApplicationRecord
end
