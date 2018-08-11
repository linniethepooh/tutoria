class QuestionsAddDefaultToAnswered < ActiveRecord::Migration[5.2]
  def change
    change_column_default :questions, :answered, false
  end
end
