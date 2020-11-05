class Appointment < ApplicationRecord
  belongs_to :veterinarian
  belongs_to :pet
end
