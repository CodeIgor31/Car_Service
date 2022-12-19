# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe UsersController do
  include RSpec::Expectations
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @password = 'Igor310304'
    @base_url = 'http://localhost:3000'
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:each) do
    @driver.quit
  end

  it 'should login and get an answer' do
    @driver.get("#{@base_url}/sessions/new")
    @driver.find_element(:id, 'log_mail').send_keys 'yagmurov.igor@mail.ru'
    @driver.find_element(:id, 'log_pass').send_keys @password
    @driver.find_element(:id, 'log_btn').click
    expect((@driver.find_element(:id, 'msg').text)).to eq('Успешный вход')
  end

  it 'should get a flash message' do
    @driver.get("#{@base_url}/my_services/show")
    expect((@driver.find_element(:id, 'msg').text)).to eq('Вы не авторизованы')
  end

  it 'should get a flash message' do
    @driver.get("#{@base_url}/consultations/index")
    expect((@driver.find_element(:id, 'msg').text)).to eq('Вы не авторизованы')
  end
end
