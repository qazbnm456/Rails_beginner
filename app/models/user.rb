class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 5}
  validates :name, presence: true
  validates :github_link, uniqueness: true

  has_secure_password validations: false
end