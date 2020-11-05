class Appointment < ApplicationRecord
  belongs_to :veterinarian
  belongs_to :pet

  validates :start_time, :end_time, :location, presence: true
end
