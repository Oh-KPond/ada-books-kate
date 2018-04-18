class User < ApplicationRecord

  def self.build_from_github(auth_data)
    return User.create(
      provider: auth_data[:provider],
      uid: auth_data[:uid],
      email: auth_data[:info][:email],
      name: auth_data[:info][:nickname]
    )
  end
end
