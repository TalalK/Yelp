class Restaurant < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	validates :name, length: { minimum: 3 }

	def average_rating

		return "N/A" if reviews.none?
		reviews.average(:rating)

	end
end
