# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'works', type: :system do
  let!(:vacancy_data) { { title: 'Тестовая вакансия' } }
  let!(:vacancy_main) { Vacancy.create(vacancy_data) }
  scenario 'creating work application' do
    user = User.create(id: '1', first_name: 'Игорь', second_name: 'Ярубов', email: 'yarub@mail.ru', phone: '+71111111112', password: '12345',
                       password_confirmation: '12345', email_confirmed: 'true')
    visit login_path

    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    find('#log_btn').click

    expect(page).to have_text('Успешный вход')

    find('#work_pag').click

    find('#work_btn').click

    fill_in 'age', with: '19'
    choose(option: 'women')
    fill_in 'about', with: 'Супер пупер текст'
    fill_in 'task_1', with: 'Супер пупер задание 1'
    fill_in 'task_2', with: 'Супер пупер задание 2'
    fill_in 'task_3', with: 'Супер пупер задание 3'

    find('#work_app').click

    expect(page).to have_text('Ваша заявка вскоре будет рассмотрена')
  end
end
