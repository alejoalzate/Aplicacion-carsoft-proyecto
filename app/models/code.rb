class Code < ActiveRecord::Base
  attr_accessible :code
  
  def self.search(search)
		where("code like '%#{search}%' ")
	end
	
end
