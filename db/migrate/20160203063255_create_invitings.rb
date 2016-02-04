class CreateInvitings < ActiveRecord::Migration
  def change
    create_table :invitings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :invitation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
