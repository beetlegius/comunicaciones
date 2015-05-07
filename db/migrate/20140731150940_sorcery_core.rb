class SorceryCore < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombre, :email, :rol, :crypted_password, :salt, null: false

      t.boolean :recibe_notificaciones, default: true
      t.references :empresa, index: true
      t.timestamps
    end

    add_index :usuarios, :email, unique: true
  end
end