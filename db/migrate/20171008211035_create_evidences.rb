class CreateEvidences < ActiveRecord::Migration[5.1]
  def change
    create_table :evidences do |t|
      t.string :codigo
      t.string :nombre
      t.string :descripcion
      t.references :universidad, foreign_key: true
      t.references :usuario, foreign_key: true
      t.references :evidencetype, foreign_key: true

      t.timestamps
    end
  end
end
