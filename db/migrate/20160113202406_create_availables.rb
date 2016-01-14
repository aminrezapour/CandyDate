class CreateAvailables < ActiveRecord::Migration
  def change
    create_table :availables do |t|
      t.datetime :slot
      t.boolean :taken, :default => false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
