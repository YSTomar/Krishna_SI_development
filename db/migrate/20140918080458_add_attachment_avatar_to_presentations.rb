class AddAttachmentAvatarToPresentations < ActiveRecord::Migration
  def self.up
    change_table :presentations do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :presentations, :avatar
  end
end
