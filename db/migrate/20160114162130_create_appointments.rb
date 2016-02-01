class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :slot
      t.text :days_user_1
      t.text :days_user_2
      t.text :all_suggestions
      t.string :tel_user_1
      t.string :tel_user_2
      t.references :suggestion, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
