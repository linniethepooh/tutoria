class AddAnsweredBooleanToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :answered, :boolean
  end
end
