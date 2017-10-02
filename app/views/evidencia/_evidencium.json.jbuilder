json.extract! evidencium, :id, :codigo, :nombre, :descripcion, :universidad_id, :usuario_id, :tipo_evidencia_id, :created_at, :updated_at
json.url evidencium_url(evidencium, format: :json)
