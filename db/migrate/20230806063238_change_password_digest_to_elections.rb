class ChangePasswordDigestToElections < ActiveRecord::Migration[7.0]
  def change
    rename_column :elections, :password_digest, :password
  end
end
