class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable
  after_create :set_default_role
  has_one :user_address , dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  accepts_nested_attributes_for :user_address
  has_many :blogs, dependent: :destroy
  has_many :posts,   dependent: :destroy
  def set_default_role
    add_role(:user) if self.roles.blank?
  end
end




