# frozen_string_literal: true

require 'securerandom'
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email).with_message('не может быть пустым') }
    it { should validate_presence_of(:first_name).with_message('не может быть пустым') }
    it { should validate_presence_of(:second_name).with_message('не может быть пустым') }
    it { should validate_presence_of(:phone).with_message('не может быть пустым') }
    it { should validate_presence_of(:password).with_message('не может быть пустым') }

    context 'when email - invalid' do
      it { should_not allow_value(Faker::Lorem.word).for(:email) }
    end

    context 'when email - valid' do
      it {
        should allow_value("#{Faker::Lorem.word}@#{[*'a'..'z'].shuffle[2..5].join}.#{[*'a'..'z'].shuffle[2..3].join}").for(:email)
      }
    end

    context 'when first name - invalid' do
      it { should_not allow_value(Faker::Lorem.word).for(:first_name) }
    end

    context 'when first name - valid' do
      it { should allow_value([*'А'..'Я', *'а'..'я'].shuffle[2..5].join).for(:first_name) }
    end

    context 'when second name - invalid' do
      it { should_not allow_value(Faker::Lorem.word).for(:second_name) }
    end

    context 'when second name - valid' do
      it { should allow_value([*'А'..'Я', *'а'..'я'].shuffle[2..5].join).for(:second_name) }
    end

    context 'when phone - invalid' do
      it { should_not allow_value(rand(10_000_000_000..99_999_999_999).to_s).for(:phone) }
    end

    context 'when phone - valid' do
      it { should allow_value("+7#{rand(1_000_000_000..9_999_999_999)}").for(:phone) }
    end

    context 'when phone - has not only numbers' do
      it { should_not allow_value(SecureRandom.base64).for(:phone) }
    end
  end
end
