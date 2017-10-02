class CreateEscuelas < ActiveRecord::Migration[5.1]
  def change
    create_table :escuelas do |t|
      t.string :codigo
      t.string :nombre
      t.string :director
      t.references :facultad, foreign_key: true

      t.timestamps
    end
  end
end
