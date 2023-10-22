class CreateFolderUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :folder_users do |t|
      t.references :folder, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
