class User < ApplicationRecord
  # Include default devise modules. Others available are:
  class User::ParameterSanitizer < Devise::ParameterSanitizer
    def initialize(*)
      super
      permit(:sign_up, keys: [:username, :email])
    end
  end
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
      devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable
            
has_many :articles
end 
