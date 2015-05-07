class AsociarComunicacionesConEmpresas < ActiveRecord::Migration
  def change
    create_table :comunicaciones_empresas, id: false do |t|
      t.references :comunicacion, :empresa
    end
    add_index :comunicaciones_empresas, [:comunicacion_id, :empresa_id], unique: true
  end
end
