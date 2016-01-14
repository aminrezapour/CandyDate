class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :available, index: true, foreign_key: true
      t.references :suggestion, index: true, foreign_key: true
      t.string :recommend

      t.timestamps null: false
    end
  end
end
