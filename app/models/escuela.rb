class Escuela < ApplicationRecord
  belongs_to :facultad
  has_many :carreras
end
