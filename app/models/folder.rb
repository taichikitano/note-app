class Folder < ApplicationRecord
  has_many :folder_users
  has_many :users, through: :folder_users
end
