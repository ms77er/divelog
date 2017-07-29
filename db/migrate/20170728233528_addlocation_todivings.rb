class AddlocationTodivings < ActiveRecord::Migration[5.0]
  def change
        add_column :divings, :location, :string
  end
end
