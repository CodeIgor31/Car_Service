class Work < ApplicationRecord
    belongs_to :user
    enum male: [:women, :man]
    validates :age, presence: true
    validates_numericality_of :age, only_integer: true, greater_than_or_equal_to: 18
    validates :male, presence: true
    validates :task_1, :task_2, :task_3, presence: true, length: {minimum: 10}
end
