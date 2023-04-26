class User < ApplicationRecord
 has_one :cart
has_many :orders
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:trackable
  rolify
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:admin) if User.first == self
    self.add_role(:customer) if self.roles.blank?
  end
end
