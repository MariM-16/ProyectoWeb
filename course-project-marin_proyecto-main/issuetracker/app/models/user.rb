class User < ApplicationRecord
    has_many :tickets
    belongs_to :roll
    has_many :comments
    has_many :performances
    has_many :responses
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :phone, presence: true
end
