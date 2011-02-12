class CreateSubmissions < ActiveRecord::Migration
  def self.up
    create_table :submissions do |t|
      t.string :title
      t.string :authors
      t.string :institutions
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :submissions
  end
end
