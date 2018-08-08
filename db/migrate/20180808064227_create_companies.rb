class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :main_logo
      t.string :optional_logo
      t.json :styling_preferences
      t.string :address
      t.string :city
      t.string :zipcode
      t.string :country

      t.timestamps
    end
  end
end
