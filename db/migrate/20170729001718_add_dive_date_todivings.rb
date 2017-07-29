class AddDiveDateTodivings < ActiveRecord::Migration[5.0]
  def change
        add_column :divings, :DiveDate, :date
        add_column :divings, :DiveIn, :time
        add_column :divings, :DiveOut, :time
        add_column :divings, :MaxDepth, :smallint
        add_column :divings, :AvgDepth, :smallint
        add_column :divings, :WaterTemp, :smallint
        add_column :divings, :Transparancy, :smallint
        add_column :divings, :Memo, :string
  end
end
