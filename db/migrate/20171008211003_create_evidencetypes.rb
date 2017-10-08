class CreateEvidencetypes < ActiveRecord::Migration[5.1]
  def change
    create_table :evidencetypes do |t|
      t.string :codigo
      t.string :tipo

      t.timestamps
    end
  end
end
