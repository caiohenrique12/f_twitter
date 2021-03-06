class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :relationships

  validates_presence_of :email, :password, :password_confirmation
  validates :email, uniqueness: true
  validates_length_of :password, minimum: 6

  scope :find_by_user_email, -> (email) { where(" email LIKE ?", "#{email}%")}
end
