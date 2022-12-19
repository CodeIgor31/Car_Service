# frozen_string_literal: true

require 'test_helper'

class WorksControllerTest < ActionDispatch::IntegrationTest
  test 'should get main' do
    get works_main_url
    assert_response :success
  end

  test 'should get test_page' do
    get works_test_page_url
    assert_response :success
  end
end
