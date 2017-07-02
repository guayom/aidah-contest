class Setting < ApplicationRecord
  has_attached_file :logo,
    styles: { default: "350x197>", big: "600x337>" },
    :url => "/logos/:attachment/:id/:basename_:style.:extension"
  has_attached_file :image,
    styles: { default: "1000x1545>", small: "800x1236>" },
    :url => "/images/:attachment/:id/:basename_:style.:extension"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
  #translation_class.validates :terms, presence: true

  translates :terms, :welcome
  accepts_nested_attributes_for :translations, allow_destroy: true

  rails_admin do
    configure :translations, :globalize_tabs
  end
end
