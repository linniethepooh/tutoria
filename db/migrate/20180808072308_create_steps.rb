class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.references :turial, foreign_key: true
      t.time :start_time
      t.text :description
      t.string :headline
      t.text :materials

      t.timestamps
    end
  end
end
