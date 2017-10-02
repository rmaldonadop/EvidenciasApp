class Evidencium < ApplicationRecord
  belongs_to :universidad
  belongs_to :usuario
  belongs_to :tipo_evidencia
end
