class CenterProgram < ActiveRecord::Base
  belongs_to :center
  belongs_to :user
  belongs_to :program
  attr_accessible :center_id, :user_id, :program_id
  
 
	
end
