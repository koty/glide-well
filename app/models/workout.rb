# == Schema Information
#
# Table name: workouts
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  date       :date             not null
#  kind       :integer          not null
#  timestamps :datetime         not null
#

class Workout < ApplicationRecord
  belongs_to :user
  enum kind: { swimming: "0", bicycle: "1" }  # validationが通らないので数値型にしとく
end
