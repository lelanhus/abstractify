class CreateConferences < ActiveRecord::Migration
  def self.up
    create_table :conferences do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.datetime :submission_deadline

      t.timestamps
    end
  end

  def self.down
    drop_table :conferences
  end
end
