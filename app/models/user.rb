class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :participant, dependent: :destroy

  def voted_for?(category)
    Vote.where(:category_id => category.id, :user_id => self.id)
  end
end
