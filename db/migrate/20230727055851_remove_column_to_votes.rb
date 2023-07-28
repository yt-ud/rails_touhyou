class RemoveColumnToVotes < ActiveRecord::Migration[7.0]
  def change
    remove_column :votes, :user_id, :integer
    remove_column :votes, :election_id, :integer
  end
end
