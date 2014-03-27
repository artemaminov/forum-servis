class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|
      t.string :header
      t.string :body
      t.string :banner

      t.timestamps
    end
  end
end
