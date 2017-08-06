class Diving < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  
  validates :DiveNo, length: { maximum: 10 }
  validates :location, length: { maximum: 255 }
  validates :MaxDepth, length: { maximum: 3 }  
  validates :AvgDepth, length: { maximum: 3 }  
  validates :WaterTemp, length: { maximum: 3 }    
  validates :Transparancy, length: { maximum: 3 }    
  validates :Memo, length: { maximum: 255 }   
  
end
