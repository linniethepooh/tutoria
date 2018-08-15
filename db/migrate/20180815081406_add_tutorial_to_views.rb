class AddTutorialToViews < ActiveRecord::Migration[5.2]
  def change
    add_reference :views, :tutorial, foreign_key: true
  end
end
