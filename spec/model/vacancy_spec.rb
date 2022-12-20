# frozen_string_literal: true

require 'securerandom'
require 'rails_helper'

RSpec.describe Vacancy, type: :model do
  let! (:vacancy_data) {{ title: "Оригинал"}}
  let! (:vacancy_title_repeat) {{ title: "Оригинал" }}
  let! (:vacancy_main) { Vacancy.create(vacancy_data )}
  let! (:title_repeat) { Vacancy.new(vacancy_title_repeat) }

  it "created title repeated vacancy" do
    expect(title_repeat.valid?).to eq(false)
  end

  describe 'validations' do
    it { should validate_presence_of(:title).with_message('не может быть пустым') }

    context 'when title - invalid' do
      it { should_not allow_value(Faker::Lorem.word).for(:title) }
    end

    context 'when title - valid' do
      it { should allow_value([*'А'..'Я', *'а'..'я', *(0..10)].shuffle[10..100].join).for(:title) }
    end
    
  end
end
