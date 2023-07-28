class DeleteNumberOfVoteToElections < ActiveRecord::Migration[7.0]
  def change
    remove_column :elections, :number_of_votes, :integer
  end
end
