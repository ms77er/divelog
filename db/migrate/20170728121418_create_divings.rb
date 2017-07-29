class CreateDivings < ActiveRecord::Migration[5.0]
  def change
    create_table :divings do |t|
      t.references :user, foreign_key: true
      t.string :DiveNo

      t.timestamps
    end
  end
end
