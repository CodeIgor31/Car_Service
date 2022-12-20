# frozen_string_literal: true

require 'securerandom'
require 'rails_helper'

RSpec.describe ServicePoint, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:address).with_message('не может быть пустым') }
    it { should validate_presence_of(:phone_number).with_message('не может быть пустым') }

    context 'when address - invalid' do
      it { should_not allow_value(Faker::Lorem.word).for(:address) }
    end

    context 'when address is short' do
      it { should_not allow_value([*'А'..'Я', *'а'..'я'].shuffle[1..9].join).for(:address) }
    end

    context 'when address is normal length but invalid letters' do
      it { should_not allow_value(SecureRandom.alphanumeric(15)).for(:address) }
    end

    context 'when address - valid' do
      it { should allow_value([*'А'..'Я', *'а'..'я', *(0..10)].shuffle[10..100].join).for(:address) }
    end

    context 'when phone - invalid' do
        it { should_not allow_value(rand(10_000_000_000..99_999_999_999).to_s).for(:phone_number) }
      end
  
      context 'when phone - valid' do
        it { should allow_value("+7#{rand(1_000_000_000..9_999_999_999)}").for(:phone_number) }
      end
  
      context 'when phone - has not only numbers' do
        it { should_not allow_value(SecureRandom.base64).for(:phone_number) }
      end
    
  end
end
