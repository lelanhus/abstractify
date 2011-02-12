class CreateSubmissions < ActiveRecord::Migration
  def self.up
    create_table :submissions do |t|
      t.string :title
      t.string :authors
      t.string :institutions
      t.text :body
      t.integer :conference_id
      t.integer :user_id

      t.timestamps
    end
    
    add_index :submissions, :user_id
    add_index :submissions, :conference_id
  end

  def self.down
    drop_table :submissions
  end
end
