class AddAttachmentImageToSlideShows < ActiveRecord::Migration
  def self.up
    change_table :slide_shows do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :slide_shows, :image
  end
end
