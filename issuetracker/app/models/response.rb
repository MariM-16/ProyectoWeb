class Response < ApplicationRecord
    belongs_to :ticket
    belongs_to :user
    validates :response, presence: true
end
