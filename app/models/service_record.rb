class ServiceRecord < ApplicationRecord
    belongs_to :master
    belongs_to :user
    belongs_to :service
    validates :date, :user_id, presence: true
    enum status: [:prepared, :ready]
end
