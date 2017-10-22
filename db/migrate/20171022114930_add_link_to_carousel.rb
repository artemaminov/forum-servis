class AddLinkToCarousel < ActiveRecord::Migration
  def change
    add_column :carousels, :link, :string
    add_column :carousels, :new_window, :boolean
  end
end
