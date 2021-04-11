class AddAvatarBorderColorToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :img_border_color, :string
  end
end
