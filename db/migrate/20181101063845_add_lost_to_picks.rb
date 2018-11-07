class AddLostToPicks < ActiveRecord::Migration[5.2]
  def change
    add_column :picks, :lost, :boolean, default: false
  end
end
