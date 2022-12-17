class Consultation < ApplicationRecord
    belongs_to :user
    enum way: [:tel, :pochta, :any]
    validates :body, presence: true, length: {minimum: 10}
    validates :way, presence: true
end
