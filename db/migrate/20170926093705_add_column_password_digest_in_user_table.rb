class AddColumnPasswordDigestInUserTable < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password_digest, :string if !column_exists?(:users, :password_digest)
  end
end
