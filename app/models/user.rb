class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :accounts, dependent: :destroy, autosave: true
  has_many :orders, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :accounts
end
