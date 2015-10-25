class Admin < ActiveRecord::Base
  has_secure_password

  validates :name, :presence => true, :length => { :maximum => 25 }
  validates :name, :length => { :within => 3..25 },:uniqueness => true


end
