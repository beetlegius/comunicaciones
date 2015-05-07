class CreateMensajes < ActiveRecord::Migration
  def change
    create_table :mensajes do |t|
      t.text :contenido
      t.string :archivo_uid, :archivo_name

      t.references :comunicacion, :usuario, index: true
      t.timestamps
    end
  end
end
