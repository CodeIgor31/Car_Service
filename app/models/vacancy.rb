# frozen_string_literal: true

class Vacancy < ApplicationRecord
  has_many :work
  validates :title, presence: true, uniqueness: true, format: { with: /\A[а-яА-Я0-9,.!?:"'\-\(\)\s]*\z/,
    message: 'Только русские буквы, цифры и спец символы' }
end
