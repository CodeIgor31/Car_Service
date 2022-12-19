# frozen_string_literal: true

require 'securerandom'
require 'rails_helper'

RSpec.describe Work, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:age).with_message('не может быть пустым') }
    it { should validate_presence_of(:male).with_message('не может быть пустым') }
    it { should validate_presence_of(:task_1).with_message('не может быть пустым') }
    it { should validate_presence_of(:task_2).with_message('не может быть пустым') }
    it { should validate_presence_of(:task_3).with_message('не может быть пустым') }

    context 'when age lower 18' do
      it { should_not allow_value(rand(0..17)).for(:age) }
    end

    context 'when age upper 70' do
      it { should_not allow_value(rand(71..1000)).for(:age) }
    end

    context 'when age valid' do
      it { should allow_value(rand(18..70)).for(:age) }
    end

    context 'when task_1 short' do
      it { should_not allow_value([*'А'..'Я', *'а'..'я'].shuffle[1..9].join).for(:task_1) }
    end

    context 'when task_1 is normal lentgh but invalid letters' do
      it { should_not allow_value(SecureRandom.alphanumeric(15)).for(:task_1) }
    end

    context 'when task_2 short' do
      it { should_not allow_value([*'А'..'Я', *'а'..'я'].shuffle[1..9].join).for(:task_2) }
    end

    context 'when task_2 is normal lentgh but invalid letters' do
      it { should_not allow_value(SecureRandom.alphanumeric(15)).for(:task_2) }
    end

    context 'when task_3 short' do
      it { should_not allow_value([*'А'..'Я', *'а'..'я'].shuffle[1..9].join).for(:task_3) }
    end

    context 'when task_3 is normal lentgh but invalid letters' do
      it { should_not allow_value(SecureRandom.alphanumeric(15)).for(:task_3) }
    end

    context 'when task_1 is valid' do
      it { should allow_value([*'А'..'Я', *'а'..'я', *(0..10)].shuffle[10..100].join).for(:task_1) }
    end

    context 'when task_2 is valid' do
      it { should allow_value([*'А'..'Я', *'а'..'я', *(0..10)].shuffle[10..100].join).for(:task_2) }
    end

    context 'when task_3 is valid' do
      it { should allow_value([*'А'..'Я', *'а'..'я', *(0..10)].shuffle[10..100].join).for(:task_3) }
    end
  end
end
