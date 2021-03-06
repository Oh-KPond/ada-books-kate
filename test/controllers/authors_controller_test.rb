require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  it "should get index" do
  # given

  # when
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
      proc {
        post authors_path, params: {
          author: {
            name: "New Author"
          }
        }
      }.must_change 'Author.count', 1

      # then
        must_respond_with :redirect
        must_redirect_to authors_path
    end
  end

  describe "update" do
    it "updates an Author's name when given a valid name and valid author" do

      put author_path(authors(:metz).id), params: {
        author: {name: "New Name"}
      }

      edited = Author.find(authors(:metz).id)

      edited.name.must_equal "New Name"

      must_respond_with :redirect
    end
  end
end
