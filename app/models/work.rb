# frozen_string_literal: true

class Work < ApplicationRecord
  belongs_to :vacancy
  belongs_to :user
  enum male: %i[women man]
  validates :age, presence: true
  validates_numericality_of :age, only_integer: true, greater_than_or_equal_to: 18, less_than_or_equal_to: 70
  validates :male, presence: true
  validates :task_1, :task_2, :task_3, presence: true, length: { minimum: 10 }, format: { with: /\A[а-яА-Я0-9,.!?:"'\-\(\)\s]*\z/,
                                                                                          message: 'Только русские буквы, цифры и спец символы' }
end
