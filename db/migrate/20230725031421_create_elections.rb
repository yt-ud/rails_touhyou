class CreateElections < ActiveRecord::Migration[7.0]
  def change
    create_table :elections do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.integer :number_of_votes

      t.timestamps
    end
  end
end
