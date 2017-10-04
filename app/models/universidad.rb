class Universidad < ApplicationRecord
	has_many :evidencias
	has_many :usuarios
	has_many :facultads
end
