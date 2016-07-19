class Ingredient < ActiveRecord::Base
	validates :ingredient, presence: true
	validates :ramuan, presence: true

	has_and_belongs_to_many :recipes
end
