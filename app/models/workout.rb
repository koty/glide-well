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

class Workout < ApplicationRecord
  belongs_to :user
  enum kind: { swimming: 'swimming', bicycle: 'bicycle' }
  has_many :workout_details, dependent: :destroy

  def total_distance
    # workout_details.map(&:distance).sum
    workout_details.map{|x| x.distance}.sum
  end
end
