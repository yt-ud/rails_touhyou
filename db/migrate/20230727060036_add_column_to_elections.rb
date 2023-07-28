class AddColumnToElections < ActiveRecord::Migration[7.0]
  def change
    add_column :elections, :startdate, :datetime
    add_column :elections, :enddate, :datetime
  end
end
