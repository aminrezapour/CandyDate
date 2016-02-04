class CreateSuggestings < ActiveRecord::Migration
  def change
    create_table :suggestings do |t|
      t.references :suggestion, index: true, foreign_key: true
      t.references :invitation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
