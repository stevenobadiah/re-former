class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true, length: { minimum: 4, maximum: 12 }
    validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[\w+\-.]*\.[a-z]+\z/i }
    validates :password, presence: true, length: { minimum: 6, maximum: 16 }
end
