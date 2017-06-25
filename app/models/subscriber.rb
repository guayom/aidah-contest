class Subscriber < ApplicationRecord
  validates :email, presence: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :name, presence: true
  validates :tel, presence: true
  validates :category, presence: true
  validates :country, presence: true
  #to validate terms of service checkbox
  validates :terms_of_service, acceptance: true

  def category_enum
    ["General", "Belly Dancer", "Profesora danzas del Medio Oriente"]
  end
end
