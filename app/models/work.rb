class Work < ApplicationRecord
    belongs_to :user
    enum male: [:women, :man]
end
