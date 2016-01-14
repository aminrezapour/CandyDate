class CreateDatings < ActiveRecord::Migration
  def change
    create_table :datings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :appointment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
