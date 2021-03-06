class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #devise :omniauthable, :omniauth_providers: [:google]

  def email_requiered?
  	false
  end

  has_many :evidences

  validates :rut, presence: true, uniqueness: true
end
