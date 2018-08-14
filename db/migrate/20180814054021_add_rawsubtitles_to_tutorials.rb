class AddRawsubtitlesToTutorials < ActiveRecord::Migration[5.2]
  def change
    add_column :tutorials, :rawsubtitles, :hstore, default: {}, null: false
  end
end
