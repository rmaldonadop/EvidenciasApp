class Universidad < ApplicationRecord
	has_many :evidences
	has_many :usuarios
	has_many :facultads
end
