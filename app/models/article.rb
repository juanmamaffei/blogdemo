class Article < ApplicationRecord
	belongs_to :user
	validates :title, presence: true, uniqueness: true
	validates :body, presence: true, length: {minimum:20}

	before_create :set_visits_count #antes de crear el archivo, pone en cero el contador de visitas

	def update_visits_count
		Article.update(visits_count: self.visits_count + 1)
	end

	private

	def set_visits_count
		self.visits_count = 0
	end
end
