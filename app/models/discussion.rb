class Discussion < ActiveRecord::Base
  belongs_to :project
  has_many :comments, dependent: :destroy
  
end