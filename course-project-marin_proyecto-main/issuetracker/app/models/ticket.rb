class Ticket < ApplicationRecord
    belongs_to :user
    belongs_to :executive, class_name: "User"
    has_many :comments
    has_many :responses
    validates :title, presence: true
    validates :description, presence: true
end
