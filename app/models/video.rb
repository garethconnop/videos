class Video < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_attached_file :image, styles: { large: "960x540>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end