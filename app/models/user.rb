class User < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, confirmation: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
    validates :email_confirmation, presence: true, length: { in: 6..50 }
    validates :cpf, presence: true, length: { is: 11 }, uniqueness: true
    validates :gender, presence: true
    validates :phone, presence: true

end
