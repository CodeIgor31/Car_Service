# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WorkMailer, type: :mailer do
  describe 'notify' do
    let!(:user_data) do
      { first_name: 'Игорь', second_name: 'Якунин', password: '123', password_confirmation: '123', email: 'user@mail.ru',
        phone: '+79999999999' }
    end
    let!(:user) { User.create(user_data) }
    let!(:work_data) do
      { user_id: '1', age: '20', male: 'women', about: 'Какой-то текст здесь', task_1: 'Какой-то текст здесь',
        task_2: 'Какой-то текст здесь', task_3: 'Какой-то текст здесь', vacancy_id: '1' }
    end
    let!(:work) { Work.create(work_data) }
    let!(:vacancy_data) { { id: '1', title: 'Тест' } }
    let!(:vacancy) { Vacancy.create(vacancy_data) }

    let(:mail) { WorkMailer.with(user:, work:).my_application_for_work }

    it 'renders the headers' do
      expect(mail.subject).to eq('Заявка о приеме на работу')
      expect(mail.to).to eq(['user@mail.ru'])
      expect(mail.from).to eq([ENV['GMAIL_USERNAME']])
    end
    it 'renders the body' do
      expect(mail.body.encoded).not_to be_empty
    end
  end
end
