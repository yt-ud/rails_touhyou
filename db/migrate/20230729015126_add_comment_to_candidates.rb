class AddCommentToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :comment, :text
  end
end
