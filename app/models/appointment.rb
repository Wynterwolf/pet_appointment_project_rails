class Appointment < ApplicationRecord
  belongs_to :veterinarian
  belongs_to :pet

  validates :start_time, :end_time, :location, presence: true
  validate :vet_overlap
  validate :pet_overlap
  validate :ends_after_start
  
  #Don't forget about doublebooking the appointments
  def vet_overlap
    this_start = self.start_time
    this_end = self.end_time
    overlap = veterinarian.appointments.any? do |appointment|
      other_start = appointment.start_time
      other_end = appointment.end_time
      other_start < this_end && this_end < other_end || other_start < this_start && this_start < other_end
    end
    if overlap
      errors.add(:doctor, 'has a conflicting appointment')
    end
  end
#What if the pet is doublebooked
  def pet_overlap
    this_start = self.start_time
    this_end = self.end_time
    overlap = veterinarian.appointments.any? do |appointment|
      other_start = appointment.start_time
      other_end = appointment.end_time
      other_start < this_end && this_end < other_end || other_start < this_start && this_start < other_end
    end
    if overlap
      errors.add(:pet, 'has a conflicting appointment')
    end
  end
#keeps appointments start time before end time
  def ends_after_start
    if start_time > end_time
      errors.add(:start_time, 'must start before the appointment end')
    end
  end
end
