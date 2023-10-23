class Folder < ApplicationRecord
  has_many :folder_users
  has_many :users, through: :folder_users

  validates :name, presence: true
end
