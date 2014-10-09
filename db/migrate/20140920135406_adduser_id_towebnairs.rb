class AddUserIdToWebnairs < ActiveRecord::Migration
 def change
    add_column :webnairs, :user_id, :integer
  end
end
