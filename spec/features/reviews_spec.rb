# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reviews', type: :feature do
  # scenario 'valid' do
  #   visit new_session_path

  #   fill_in :email, with: 'yagmurov.igor@mail.ru'
  #   fill_in :password, with: 'Igor310304'

  #   click_on :commit

  #   expect(find('#msg')).to have_text('Комментарий оставлен')
    # visit comm_path

    # fill_in :body, with: 'Очень хорошо, все супер пупер'

    # find('#rev_btn').click

    # visit home_path

    # expect(find('#msg')).to have_text('Комментарий оставлен')
  # end

  scenario 'invalid' do
    visit comm_path

    fill_in :body, with: 'fashjkasdfjbajsdfasfhlja'

    find('#rev_btn').click

    expect(find('#msg')).to have_text('Вы не авторизованы')
  end
end