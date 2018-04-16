require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  it "should get index" do
  # when

  # given
  get authors_path

  # then
  must_respond_with :success

  end
end
