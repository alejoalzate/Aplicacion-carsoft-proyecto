class Team < ActiveRecord::Base
  belongs_to :type_material
  belongs_to :porter
  belongs_to :user
  attr_accessible :charger, :color, :mouse, :name, :serial, :type_team, :porter_id, :user_id,
  :type_material_id
  def self.search(search)
		where("color  like '%#{search}%' or name like '%#{search}%' or serial like '%#{search}%'")
	end
end
