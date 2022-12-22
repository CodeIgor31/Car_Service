# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'my_services', type: :feature do
  scenario 'invalid' do
    visit 'my_services/show'

    expect(find('#msg')).to have_text('Вы не авторизованы')
  end
end
