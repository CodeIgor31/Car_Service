# frozen_string_literal: true

class Consultation < ApplicationRecord
  belongs_to :user
  enum way: %i[tel pochta any]
  validates :body, presence: true, length: { minimum: 10 }, format: { with: /\A[а-яА-Я0-9,.!?:"'\s]*\z/,
                                                                      message: 'Только русские буквы, цифры и спец символы' }
  validates :way, presence: true
end
