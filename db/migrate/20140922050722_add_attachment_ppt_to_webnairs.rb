class AddAttachmentPptToWebnairs < ActiveRecord::Migration
  def self.up
    change_table :webnairs do |t|
      t.attachment :ppt
    end
  end

  def self.down
    remove_attachment :webnairs, :ppt
  end
end
