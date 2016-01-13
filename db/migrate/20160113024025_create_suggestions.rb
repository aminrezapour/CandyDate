class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.string :ext_link
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
