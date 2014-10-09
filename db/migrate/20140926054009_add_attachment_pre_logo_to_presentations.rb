class AddAttachmentPreLogoToPresentations < ActiveRecord::Migration
  def self.up
    change_table :presentations do |t|
      t.attachment :pre_logo
    end
  end

  def self.down
    remove_attachment :presentations, :pre_logo
  end
end
