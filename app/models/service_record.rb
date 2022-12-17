class ServiceRecord < ApplicationRecord
    belongs_to :master
    belongs_to :user
    belongs_to :service
    validates :date, :user_id, presence: true
    enum status: [:prepared, :ready]
    has_many_attached :pictures

    def picture_thumb(pic)
        pic.variant(resize_to_limit: [300, 300]).processed

    end
end
