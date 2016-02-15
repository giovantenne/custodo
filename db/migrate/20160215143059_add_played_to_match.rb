class AddPlayedToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :played, :boolean, default: false
  end
end
