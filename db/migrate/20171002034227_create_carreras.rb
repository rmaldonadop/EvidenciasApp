class CreateCarreras < ActiveRecord::Migration[5.1]
  def change
    create_table :carreras do |t|
      t.string :codigo
      t.string :nombre
      t.string :jefe_carrera
      t.references :escuela, foreign_key: true

      t.timestamps
    end
  end
end
