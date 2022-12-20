# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reviews', type: :feature do
  scenario 'creating new questions' do
    visit new_user_path

    fill_in 'email', with: 'yarub@mail.ru'
    fill_in 'first_name', with: 'Игорь'
    fill_in 'second_name', with: 'Ярубов'
    fill_in 'phone', with: '+71111111111'
    find_field('pass').set('12345')
    find_field('pass_conf').set('12345')

    find('#btn').click

    expect(page).to have_text('На почту выслано письмо, подтвердите, пожалуйста')

    # find('#ex_btn').click

    # User.create(first_name: 'Игорь', second_name: 'Ярубов', email: 'yarub@mail.ru', phone: '+71111111111', password: '12345',
    #             password_confirmation: '12345')
    # user_id = User.find_by(email: 'yarub@mail.ru')[:id]

    # visit login_path

    # fill_in 'email', with: 'yagmurov.igor@mail.ru'
    # fill_in 'password', with: 'Igor310304'
    # find('#log_btn').click

    # expect(page).to have_text('Успешный вход')

    # find('#revs').click

    # fill_in 'body', with: 'Все хорошо, я доволен'
    # click_on :commit

    # expect(Review.find_by(user_id: user_id, body: 'Все хорошо, я доволен').present?).to eq true
    # expect(page).to have_text('Комментарий оставлен')
  end

  scenario 'invalid' do
    visit comm_path

    fill_in :body, with: 'fashjkasdfjbajsdfasfhlja'

    find('#rev_btn').click

    expect(find('#msg')).to have_text('Вы не авторизованы')
  end
end