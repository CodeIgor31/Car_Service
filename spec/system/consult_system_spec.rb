# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'consultations', type: :system do

  scenario 'creating consultation' do

    user = User.create(id: "1", first_name: 'Игорь', second_name: 'Ярубов', email: 'yarub@mail.ru', phone: '+71111111112', password: '12345',
                password_confirmation: '12345', email_confirmed: "true")
    visit login_path

    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    find('#log_btn').click

    expect(page).to have_text('Успешный вход')
    
    visit consult_path

    fill_in 'body', with: 'Все хорошо, я доволен'
    choose(option: 'mail')
    find('#cbtn').click

    expect(page).to have_text('Ваша заявка на консультацию оставленна, с вами свяжутся в течение часа')
  end
end