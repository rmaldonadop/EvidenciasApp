class CreatePermisos < ActiveRecord::Migration[5.1]
  def change
    create_table :permisos do |t|
      t.string :codigo
      t.string :tipo
      t.string :descripcion

      t.timestamps
    end
  end
end
