class Movie < ApplicationRecord
	has_many :reviews
	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			movie_hash = row.to_hash
			movie = find_or_create_by!(movie_name: movie_hash['Movie name'], description: movie_hash['Description'],year: movie_hash['Year'], director: movie_hash['Director'],actor: movie_hash['Actor'], filming_location: movie_hash['Filming location'], country: movie_hash['Country'])
			movie.update_attributes(movie_hash)
		end
	end
end
