class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.references :user, null: false, foreign_key: true
      t.references :election, null: false, foreign_key: true
      t.string :name
      t.datetime :startdate
      t.datetime :enddate

      t.timestamps
    end
  end
end
