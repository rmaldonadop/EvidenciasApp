class Facultad < ApplicationRecord
  belongs_to :universidad
  has_many	:escuelas
end
