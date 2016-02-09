class CreateRainchecks < ActiveRecord::Migration
  def change
    create_table :rainchecks do |t|
      t.references :invitation, index: true, foreign_key: true
      t.string :days_rainchecker

      t.timestamps null: false
    end
  end
end
