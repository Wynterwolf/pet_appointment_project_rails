class Appointment < ApplicationRecord
  belongs_to :veterinarian
  belongs_to :pet

  validates :start_time, :end_time, :location, presence: true
  validate :vet_overlap, :pet_overlap, if: :starts_before_it_ends?
  validate :ends_after_it_starts
  
  #Don't forget about doublebooking the appointments
  def vet_overlap
    this_start = self.start_time
    this_end = self.end_time
    return if this_end < this_start
    overlap = veterinarian.appointments.any? do |appointment|
      other_start = appointment.start_time
      other_end = appointment.end_time
      other_start < this_end && this_end < other_end || other_start < this_start && this_start < other_end
    end
    if overlap
      errors.add(:veterinarian, 'has a conflicting appointment')
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
#keeps appointments straight (ends after start, start after ends)
  def ends_after_it_starts
    if !starts_before_it_ends?
      errors.add(:start_time, 'must be before the end time')
    end
  end

  def starts_before_it_ends?
    start_time < end_time
  end

  #define doctor to use on appointment index view
  def vet_name
    self.veterinarian.name
  end

  def pet_name
    self.pet.name
  end
end
