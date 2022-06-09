class Booking < ApplicationRecord
  belongs_to :user_seeker, class_name: "User"
  belongs_to :user_guide, class_name: "User"
  validates :topic, presence: true
  validates :user_guide, presence: true
  validates :user_seeker, presence: true
  has_many :chatrooms
end
