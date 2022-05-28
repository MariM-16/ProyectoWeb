class Performance < ApplicationRecord
    belongs_to :user
    belongs_to :executive, class_name: "User"
    validates :evaluation, presence: true
end
