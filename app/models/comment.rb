class Comment < ActiveRecord::Base
  belongs_to :discussion
  belongs_to :user
  has_many :likes, dependent: :nullify
  has_many :users, through: :likes

end
