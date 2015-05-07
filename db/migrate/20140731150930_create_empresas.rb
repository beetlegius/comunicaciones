class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nombre, :email, :color
      t.string :imagen_uid, :imagen_name

      t.boolean :esta_habilitada, default: false
      t.integer :usuarios_count, null: false, default: 0
      t.references :organizacion, index: true
      t.timestamps
    end
    add_index :empresas, :esta_habilitada, where: 'esta_habilitada = true'
  end
end
