class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  belongs_to :participant
  has_one :jury, dependent: :destroy
  accepts_nested_attributes_for :jury
  has_many :votes

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/contest/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

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

  # User::Roles
  # The available roles
  Roles = [ :admin, :jury, :participant, :default ]

  def is?( requested_role )
    self.role == requested_role.to_s
  end

  protected
  def confirmation_required?
    false
  end
end
