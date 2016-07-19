class Cuisine < ActiveRecord::Base
	validates :cuisine, presence: true
	validates :masakan, presence: true
end
