class Veterinarian < ApplicationRecord
    #validations
    validates ${:name, :phone_number, :specializations, presence :true}
    
end
