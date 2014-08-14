class User < ActiveRecord::Base
  before_create :set_default

  has_one :profile

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  # attr_accessor :phone_number

  validates_uniqueness_of :phone_number
  validates_presence_of :phone_number , :password
  validates_confirmation_of   :password, :on=>:create
  validates_length_of :password, :within => Devise.password_length, :allow_blank => true

  def email_required?
    false
  end

  def set_default
    self.role_id = 0
  end
end
