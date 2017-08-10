class AddOwnerToCarousels < ActiveRecord::Migration
  def change
    add_column :carousels, :dealer, :boolean, :default => false
  end
end
