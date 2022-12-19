# frozen_string_literal: true

require 'securerandom'
require 'rails_helper'

RSpec.describe ServiceRecord, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:date).with_message('не может быть пустым') }
  end
end
