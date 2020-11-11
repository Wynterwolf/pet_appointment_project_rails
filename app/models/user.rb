class User < ApplicationRecord
  has_many :pets
  has_many :veterinarians, through: :pets
  has_many :appointments, through: :pets
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

#for omniauth
  devise :omniauthable, omniauth_providers: [:google_oauth2]

end
