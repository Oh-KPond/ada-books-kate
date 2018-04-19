require "test_helper"

describe SessionsController do
  describe "create" do
    it "should log in and exixting user and redirect to root route" do
      existing_user = users(:ada)

      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(existing_user))

      proc {
        get auth_callback_path('github')
      }.must_change 'User.count', 0
      must_redirect_to root_path
    end

    it "should create a new user and redirect to the root route" do
      new_user = User.new(
        provider: 'github',
        uid: 999,
        name: 'test user',
        email: 'test@test.com'
      )

      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(new_user))

      proc {
        get auth_callback_path(new_user.provider)
      }.must_change 'User.count', 1

      must_redirect_to root_path
      must_respond_with :redirect
    end
  end
end
