class RenameColorToUserMigration < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :img_border_color, :profile_background_color
  end
end
