# frozen_string_literal: true

class ServicePoint < ApplicationRecord
  has_many :service_record
  validates :address, presence: true, length: { minimum: 10 }, uniqueness: true,
  format: { with: /\A[а-яА-Я0-9,.!?:"'\-()\s]*\z/, message: 'Только русские буквы, цифры и спец символы' }
  validates :phone_number, presence: true, uniqueness: true, format: { with: /\A\+7\d{10}\z/,
  message: 'Начинается с +7 и только цифры(10 штук)' }
end
