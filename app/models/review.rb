class Review < ApplicationRecord
    has_many_attached :photos
    belongs_to :user

    def comm_thumb(pic)
        pic.variant(resize_to_limit: [300, 300]).processed
    end
end
