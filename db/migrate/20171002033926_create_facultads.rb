class CreateFacultads < ActiveRecord::Migration[5.1]
  def change
    create_table :facultads do |t|
      t.string :codigo
      t.string :nombre
      t.string :direccion
      t.string :decano
      t.references :universidad, foreign_key: true

      t.timestamps
    end
  end
end
