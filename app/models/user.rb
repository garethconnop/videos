class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :videos
  has_many :comments

  # avatar
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: ":style/user.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
