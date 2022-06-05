class Ticket < ApplicationRecord
    belongs_to :user
    belongs_to :executive, class_name: "User"
    has_many :comments, dependent: :destroy
    has_many :performances, dependent: :destroy
    has_many :responses, dependent: :destroy
    validates :title, presence: true
    validates :description, presence: true
    has_one_attached :documents
    
end
