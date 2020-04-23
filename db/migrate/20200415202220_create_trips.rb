class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.date :date
      t.time :time
      t.string :startLocation
      t.string :endLocation
      t.integer :riders
      t.integer :stairs
      t.string :notes
      t.references :passenger, null: false, foreign_key: true
    end
  end
end
