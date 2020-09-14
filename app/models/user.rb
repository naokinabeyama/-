class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }
  has_many :books, dependent: :destroy
  # validates :email, presence: true
  # validates :password, presence: true
   # No use email
  def email_required?
    false
  end
 
  def email_changed?
    false
  end

end
