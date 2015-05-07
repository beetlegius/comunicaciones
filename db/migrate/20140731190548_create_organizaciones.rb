class CreateOrganizaciones < ActiveRecord::Migration
  def change
    create_table :organizaciones do |t|
      t.string :nombre, :url

      t.references :usuario, index: true
      t.timestamps
    end
    add_index :organizaciones, :url, unique: true
  end
end
