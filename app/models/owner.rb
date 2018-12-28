class Owner < ApplicationRecord
    has_many :houses
    validates :name, presence: true,length: { maximum: 255 }
     validates :phone_number, presence: true,length: { maximum: 12 }
    validates :email, presence: true,length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
            before_validation { email.downcase! }
    has_secure_password
    validates :password,presence: true,length:{ minimum:4 }
end
