# frozen_string_literal: true

class Service < ApplicationRecord
  has_many :service_records
  validates :title, :description, :price, presence: true
  validates :title, uniqueness: true, format: { with: /\A[а-яА-Я0-9,.!?:"'\s]*\z/,
     message: 'Только русские буквы, цифры и спец символы' }
  validates :description, length: {minimum: 10}, format: { with: /\A[а-яА-Я0-9,.!?:"'\s]*\z/,
    message: 'Только русские буквы, цифры и спец символы' }
    validates_numericality_of :price, only_integer: true, greater_than_or_equal_to: 1
end
