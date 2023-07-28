class AddPasswordDigestToElections < ActiveRecord::Migration[7.0]
  def change
    add_column :elections, :password_digest, :string
  end
end
