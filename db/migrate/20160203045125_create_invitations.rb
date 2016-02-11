class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :invitee_tel
      t.string :days_inviter
      t.string :invitee_name
      t.integer :inviter_id
      t.integer :invitee_id
      t.boolean :confirmed, :default => false

      t.timestamps null: false
    end
  end
end
