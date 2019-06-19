class AddExternalFlagToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :external, :boolean, default: false
  end
end
