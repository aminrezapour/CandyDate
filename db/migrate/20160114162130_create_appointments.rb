class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :day
      t.references :suggestion, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
