# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ConsultationMailer, type: :mailer do
  describe 'notify' do
    let!(:user_data) do
      { id: '1', first_name: 'Игорь', second_name: 'Якунин', password: '123', password_confirmation: '123',
        email: 'user@mail.ru', phone: '+79999999999' }
    end
    let!(:user) { User.create(user_data) }

    let(:mail) { ConsultationMailer.with(user:).my_consult }

    it 'renders the headers' do
      expect(mail.subject).to eq('Заявка на консультацию')
      expect(mail.to).to eq(['user@mail.ru'])
      expect(mail.from).to eq([ENV['GMAIL_USERNAME']])
    end
    it 'renders the body' do
      expect(mail.body.encoded).not_to be_empty
    end
  end
end
