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
#

require 'test_helper'

class WorkoutDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
