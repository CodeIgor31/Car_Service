# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'edit_service', type: :system do
  scenario 'editing service' do
    user = User.create(id: '1', first_name: 'Игорь', second_name: 'Ярубов', email: 'yarub@mail.ru', phone: '+71111111121', password: '12345',
                       password_confirmation: '12345', email_confirmed: 'true')
    Service.create(id: '1', title: 'Тестовая услуга', description: 'Супер описание теста', price: '2000')

    ServicePoint.create(id: '1', address: 'Тестовый адрес', phone_number: '+72222222222')

    Master.create(id: '1', fio: 'Тестовый мастер', age: '25', stage: '3', about: 'Супер описание мастера')
    service = ServiceRecord.create(id: '1', trouble: '', date: '2023-05-05', user_id: '1', service_id: '1',
                                   master_id: '1', service_point_id: '1')
    visit login_path

    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    find('#log_btn').click

    expect(page).to have_text('Успешный вход')

    visit 'my_services/edit?ord_id=1'

    find('#edit_rec').click

    expect(page).to have_text('Дата записи обновлена')
  end
end
