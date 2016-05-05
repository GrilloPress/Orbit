class User < ActiveRecord::Base
  belongs_to :department
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  before_save :username_to_snake_case
  
  # paperclip
  has_attached_file :profile_pic, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\Z/
  
  # validations
  validates :biography, length: { maximum: 1000, too_long: "- %{count} characters is the maximum allowed for this field" }
  validates :username, length: { minimum: 5 }
  validates :username, uniqueness: { case_sensitive: false }
  
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255, message: "maximum length is %{count}" },
                    format: { with: VALID_EMAIL_REGEX, message: "doesn't appear valid" },
                    uniqueness: { case_sensitive: false, message: " is not unique" }
  
  protected
  
  def username_to_snake_case
    
    self.username = username.strip.tr(" ", "_")

  end
  
end