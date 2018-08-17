class CreateTutorials < ActiveRecord::Migration[5.2]
  def change
    create_table :tutorials do |t|
      t.string :subtitle
      t.string :product
      t.text :materials
      t.string :title
      t.text :description
      t.boolean :public, default: false
      t.references :company, foreign_key: true
      t.string :file
      t.string :filehigh
      t.string :filemedium
      t.string :filelow
      t.string :image

      t.timestamps
    end
  end
end
