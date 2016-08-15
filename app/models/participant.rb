class Participant < ApplicationRecord
  has_and_belongs_to_many :categories
  has_many :votes, dependent: :destroy
  belongs_to :user

  def nombre_completo
    "#{self.name} #{self.lastname} #{self.lastname2}"
  end

  def slug
    self.nombre_completo.parameterize
  end
end
