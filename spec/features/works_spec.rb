# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'works', type: :feature do
  scenario 'invalid' do
    visit work_path

    find('#work_btn').click

    find('#work_app').click
    expect(find('#msg')).to have_text('Вы не авторизованы')
  end
end
