class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.references :position
      t.references :user
      t.references :project
      t.integer :weekload
      t.boolean :owner
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
