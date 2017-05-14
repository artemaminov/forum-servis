class AddFilenameToPricelist < ActiveRecord::Migration
  def change
    add_column :pricelists, :filename, :string
  end
end
