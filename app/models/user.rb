class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  before_save :username_to_snake_case
  
  # paperclip
  has_attached_file :profile_pic, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\Z/
  
  # validations
  validates :biography, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
  validates :username, length: { minimum: 5 }
  validates :username, uniqueness: { case_sensitive: false }
  
  protected
  
  def username_to_snake_case
    
    self.username = username.tr(" ", "_")

  end
  
end