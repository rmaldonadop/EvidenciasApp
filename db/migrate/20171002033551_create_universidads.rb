class CreateUniversidads < ActiveRecord::Migration[5.1]
  def change
    create_table :universidads do |t|
      t.string :codigo
      t.string :nombre
      t.string :direccion
      t.string :casa_matriz

      t.timestamps
    end
  end
end
