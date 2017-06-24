class Setting < ApplicationRecord
  has_attached_file :logo,
    styles: { default: "350x197>", big: "600x337>" },
    :url => "/logos/:attachment/:id/:basename_:style.:extension"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
end
