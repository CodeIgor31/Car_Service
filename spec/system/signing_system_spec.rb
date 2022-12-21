# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'signing record', type: :system do
  let! (:service_data) {{ title: 'Тестовая услуга', description: 'Супер описание теста', price: '2000' }}
  let! (:service_main) { Service.create(service_data )}

  let! (:point_data) {{ address: 'Тестовый адрес', phone_number: '+72222222222'}}
  let! (:point_main) { ServicePoint.create(point_data )}

  let! (:master_data) {{ fio: 'Тестовый мастер', age: '25', stage: '3', about: 'Супер описание мастера' }}
  let! (:master_main) { Master.create(master_data )}
  scenario 'creating sign' do

    user = User.create(id: "1", first_name: 'Игорь', second_name: 'Ярубов', email: 'yarub@mail.ru', phone: '+71111111211', password: '12345',
                password_confirmation: '12345', email_confirmed: "true")
    visit login_path

    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    find('#log_btn').click

    expect(page).to have_text('Успешный вход')

    find('#signs').click

    find('#ord').click

    find('#sign_id').click
    sleep(1)

    expect(page).to have_text('Ваша заявка оставленна')
  end
end