class AddImageProcessingToSubmissions < ActiveRecord::Migration
  def self.up
    add_column :submissions, :image_processing, :boolean
  end

  def self.down
    remove_column :submissions, :image_processing
  end
end
