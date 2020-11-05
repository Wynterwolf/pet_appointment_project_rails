class Veterinarian < ApplicationRecord
    #associations
    has_many :appointments
    has_many :pets, through: :appointments
    
    #validations
    validates :name, :phone_number, :specializations, presence: true
    
end
