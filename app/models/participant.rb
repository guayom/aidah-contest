class Participant < ApplicationRecord
  has_and_belongs_to_many :categories

  def nombre_completo
    "#{self.name} #{self.lastname} #{self.lastname2}"
  end

  def slug
    self.title.parameterize
  end
end
