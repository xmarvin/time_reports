class CreateInvites < ActiveRecord::Migration
  def self.up
    create_table :invites do |t|
      t.string :email
      t.string :current_state
      t.string :email
      t.references :project
      t.timestamps
    end
  end

  def self.down
    drop_table :invites
  end
end
