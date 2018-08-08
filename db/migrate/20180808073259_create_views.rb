class CreateViews < ActiveRecord::Migration[5.2]
  def change
    create_table :views do |t|
      t.time :start_time
      t.time :end_time
      t.string :location
      t.string :device

      t.timestamps
    end
  end
end
