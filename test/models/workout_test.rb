# == Schema Information
#
# Table name: workouts
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  date       :date             not null
#  kind       :string           not null
#  timestamps :datetime         not null
#

require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
