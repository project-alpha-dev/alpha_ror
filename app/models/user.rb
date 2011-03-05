class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :confirmable, :lockable, :recoverable,
         :rememberable, :registerable, :rememberable, :trackable, :timeoutable,
         :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def some_stuff some_arg
    some_arg
  end
end
