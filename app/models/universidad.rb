class Universidad < ApplicationRecord
	#has_many :usuarios
	has_many :facultads
	has_many :evidencias
end
