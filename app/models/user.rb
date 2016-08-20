class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :participant, dependent: :destroy
  has_one :jury, dependent: :destroy
  has_many :votes

  def vote_count(category = nil)
    if category.nil?
      Vote.where(:user_id => self.id).count
    else
      Vote.where(:category_id => category.id, :user_id => self.id).count
    end
  end

  def can_vote?(category)
    self.vote_count(category) < 1
  end
end
