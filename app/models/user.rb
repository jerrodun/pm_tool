class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :likes, dependent: :nullify
  has_many :liked_comments, through: :likes, source: :comment

  def has_liked?(comment)
    liked_comments.include? comment
  end

end
