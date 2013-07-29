class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :entities
  has_many :tags

  has_many :entity_users
  # has_many :entities, through: ...
  has_many :story_users
  # has_many :stories, through: ...
end
