class RemoveUserIdToCandidates < ActiveRecord::Migration[7.0]
  def change
    remove_column :candidates, :user_id, :integer
  end
end
