class AddChoiceToWebnair < ActiveRecord::Migration
  def change
    add_column :webnairs, :choice, :boolean
  end
end
