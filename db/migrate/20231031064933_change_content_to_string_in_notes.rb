class ChangeContentToStringInNotes < ActiveRecord::Migration[7.0]
  def change
    change_column :notes, :content, :text
  end
end
