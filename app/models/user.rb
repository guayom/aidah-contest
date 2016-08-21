class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :participant, dependent: :destroy
  has_one :jury, dependent: :destroy
  accepts_nested_attributes_for :jury
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

  def user_type?(type)
    self.user_type.present? && self.user_type == type
  end
end
