class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.references :tutorial, foreign_key: true
      t.integer :start_time
      t.text :description
      t.string :headline
      t.text :materials

      t.timestamps
    end
  end
end
