class RenameUsersToPersonas < ActiveRecord::Migration[8.0]
  def change
    rename_table :users, :personas
  end
end
