class CreatePricelists < ActiveRecord::Migration
  def change
    create_table :pricelists do |t|

      t.timestamps
    end
  end
end
