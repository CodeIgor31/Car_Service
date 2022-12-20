require "rails_helper"

RSpec.describe SigningMailer, :type => :mailer do
  describe "notify" do
    let! (:user_data) {{id: "1", first_name: "Игорь", second_name: 'Якунин', password: "123", password_confirmation: "123", email: "user@mail.ru", phone: '+79999999999' }}
    let! (:user) { User.create(user_data)}
    let! (:service_data) {{id: "1", title: 'Тестовое название', description: 'Супер-описание', price: "2000", image: ""}}
    let! (:service) {Service.create(service_data)}
    let! (:master_data) {{id: "1", fio: 'Тестовый Тестер', age: "25", stage: "8", about: 'Супер описание'}}
    let! (:master) {Master.create(master_data)}
    let! (:service_point_data) {{id: "1", address: 'Тестовая улица', phone_number: '+71111111111'}}
    let! (:service_point) {ServicePoint.create(service_point_data)}
    let! (:record_data) {{ trouble: "Какая-то проблема", date: '2023-02-02', user_id: "1", service_id: "1", status: "prepared", master_id: "1", service_point_id: "1" }}
    let! (:record) { ServiceRecord.create(record_data)}

    let(:mail) { SigningMailer.with(user: user, record: record).my_record }

    it "renders the headers" do
      expect(mail.subject).to eq("Ваш заказ")
      expect(mail.to).to eq(["user@mail.ru"])
      expect(mail.from).to eq([ENV['GMAIL_USERNAME']])
    end
    it "renders the body" do
        expect(mail.body.encoded).not_to be_empty
      end
  end
end