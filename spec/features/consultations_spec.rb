# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'consultations', type: :feature do
  scenario 'invalid' do
    visit 'consultations/index'

    expect(find('#msg')).to have_text('Вы не авторизованы')
  end
end