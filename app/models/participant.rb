class Participant < ApplicationRecord
  has_and_belongs_to_many :categories
  has_many :votes, dependent: :destroy
  has_many :participant_ratings

  has_one :user
  accepts_nested_attributes_for :user, allow_destroy: true

  def nombre_completo
    "#{self.name} #{self.lastname} #{self.lastname2}"
  end

  def slug
    self.nombre_completo.parameterize
  end

  def vote_count(category)
    self.votes.where(:category_id => category.id).count
  end
end
