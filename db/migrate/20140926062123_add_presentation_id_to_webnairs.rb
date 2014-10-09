class AddPresentationIdToWebnairs < ActiveRecord::Migration
  def change
    add_column :webnairs, :presentation_id, :integer
  end
end
