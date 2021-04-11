class DefaultValueForBackgroundColor < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :profile_background_color, :string, :default => '#008080'
  end
end
