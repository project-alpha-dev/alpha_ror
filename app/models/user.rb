class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :confirmable, :lockable, :recoverable,
         :rememberable, :registerable, :rememberable, :trackable, :timeoutable,
         :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, 
    :date_of_birth, :user_name,
    :password, :password_confirmation, :remember_me

end
