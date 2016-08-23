class Recipe < ActiveRecord::Base
	validates :recipe, presence: true
	validates :resipi, presence: true
	validates :cuisine_id, presence: true
	validates :instruction, presence: true
	validates :arahan, presence: true
	validates :time, presence: true
	validates :photo, presence: true
	validates :rating, presence: true

	has_and_belongs_to_many :occasions
	has_and_belongs_to_many :ingredients
	belongs_to :cuisine

	def self.search(inputCuisine)
	  where("cuisine_id LIKE ?", "%#{inputCuisine}%") 
	end
end
