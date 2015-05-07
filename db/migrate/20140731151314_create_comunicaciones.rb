class CreateComunicaciones < ActiveRecord::Migration
  def change
    create_table :comunicaciones do |t|
      t.string :asunto

      t.integer :mensajes_count, null: false, default: 0
      t.references :empresa, index: true
      t.timestamps
    end
  end
end
