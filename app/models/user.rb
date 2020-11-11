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

  #validates oauth
    def self.from_google(uid:, email:, full_name:, avatar_url:)
    user = User.find_or_create_by(email: email) do |u|
      u.uid = uid
      u.full_name = full_name
      u.avatar_url = avatar_url
      u.password = SecureRandom.hex
    end
    user.update(uid: uid, full_name: full_name, avatar_url: avatar_url)
    byebug
  end
end
