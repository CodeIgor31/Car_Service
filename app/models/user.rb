# frozen_string_literal: true

class User < ApplicationRecord
    attr_accessor :old_password

    has_secure_password validations: false
    has_many :service_records
    has_many :consultations
    has_one :work
    has_many :reviews
  
    validates :email, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :second_name, presence: true

    validate :password_presence
    validate :correct_old_password, on: :update
    validates :password, confirmation: true, allow_blank: true

    private
    
    def correct_old_password
      return if BCrypt::Password.new(password_digest_was).is_password?(old_password)
  
      errors.add :old_password, 'is incorrect'
    end

  def password_presence
    errors.add(:password, :blank) if password_digest.blank?
  end

  end