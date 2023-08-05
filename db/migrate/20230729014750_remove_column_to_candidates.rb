class RemoveColumnToCandidates < ActiveRecord::Migration[7.0]
  def change
    remove_column :candidates, :startdate, :datetime
    remove_column :candidates, :enddate, :datetime
  end
end
