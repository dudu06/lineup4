class AddAttachmentPhotoToPorfolios < ActiveRecord::Migration
  def self.up
    change_table :portfolios do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :portfolios, :photo
  end
end
