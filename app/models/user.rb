# frozen_string_literal: true

class User < ApplicationRecord
    has_secure_password
    has_many :service_records
    has_many :consultations
    has_one :work
  
    validates :email, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :second_name, presence: true
  end