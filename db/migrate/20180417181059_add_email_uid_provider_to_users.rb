class AddEmailUidProviderToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email, :string
    add_column :users, :uid, :integer
    add_column :users, :provider, :string
  end
end
