require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  it "should get index" do
  # when

  # given
  get authors_path

  # then
  must_respond_with :success

  end

  it "should get show" do
    get author_path(authors(:metz).id)
    must_respond_with :success
  end

  describe "edit" do
    it "should redirect to the home page when going to the edit page of an author that does not exist" do
      get edit_author_path 'foo'

      must_respond_with :redirect
      must_redirect_to root_path
    end
  end

  describe "create" do
    it "create an author with valid data" do
      # given
      # when
      post authors_path, params: {
        author: {
          name: "New Author"
        }
      }
      # then
        must_respond_with :redirect
        must_redirect_to authors_path
    end
  end
end
