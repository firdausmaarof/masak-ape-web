class Occasion < ActiveRecord::Base
	validates :occasion, presence: true
	validates :majlis, presence: true

	has_and_belongs_to_many :recipes
end
