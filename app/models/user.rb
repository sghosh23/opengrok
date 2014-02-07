class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #@attr_accessible :email, :password, :password_confirmation
  # not required for LDAP :recoverable, :registerable, :validatable
  devise :ldap_authenticatable, :rememberable, :trackable

  validates_uniqueness_of :email, :allow_blank => true

  before_save :get_ldap_email, :get_ldap_firstname, :get_ldap_lastname

  def get_ldap_email
  	self.email = Devise::LDAP::Adapter.get_ldap_param(self.username, "mail").first
  end

  def get_ldap_firstname
    self.firstname = Devise::LDAP::Adapter.get_ldap_param(self.username, "givenName").first
  end
  def get_ldap_lastname
    self.lastname = Devise::LDAP::Adapter.get_ldap_param(self.username, "sn").first
  end
 
end