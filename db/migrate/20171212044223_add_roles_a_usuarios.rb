class AddRolesAUsuarios < ActiveRecord::Migration[5.1]
  def change
  	add_column :usuarios, :rol_super, :boolean, default: false
    add_column :usuarios, :rol_admin, :boolean, default: false
    add_column :usuarios, :rol_usuario, :boolean, default: true
  end
end
