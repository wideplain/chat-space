class Group < ApplicationRecord
  has_many :users, through: :group_users
  has_many :group_users
  accepts_nested_attributes_for :group_users
  #validates_presence_of :user_id, :text, :group_id
end
