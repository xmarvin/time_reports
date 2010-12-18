class CreateIntervals < ActiveRecord::Migration
  def self.up
    create_table :intervals do |t|
      t.text :note
      t.time :start
      t.time :finish
      t.date :date, :null => false
      t.references :project
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :intervals
  end
end
