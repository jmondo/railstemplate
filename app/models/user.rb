class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :email, uniqueness: true, format: /@/

  has_attached_file :avatar, styles: { thumb: "50x50#", large: "200x200#", medium: "150x150#" }, default_url: "/images/:style/avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { value: login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
