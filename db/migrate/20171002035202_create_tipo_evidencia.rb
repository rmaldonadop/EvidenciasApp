class CreateTipoEvidencia < ActiveRecord::Migration[5.1]
  def change
    create_table :tipo_evidencia do |t|
      t.string :codigo
      t.string :tipo

      t.timestamps
    end
  end
end
