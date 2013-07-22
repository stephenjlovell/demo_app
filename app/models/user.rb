require 'will_paginate/array'

class User < ActiveRecord::Base

  attr_accessible :name, :email, :password, :password_confirmation, :password_reset_token, :password_reset_time, :account_activation_token

  has_many :microposts, dependent: :destroy

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  has_secure_password

  before_save do 
    create_remember_token
    create_account_activation_token
    email.downcase!
  end

  state_machine :account_status, initial: :inactive do
    event :activate_user do
      transition inactive: :active
    end
    event :deactivate_user do
      transition active: :inactive
    end
  end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX }, 
            uniqueness: {case_sensitive: false} 
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  # removes the password_digest error message if applicable:
  after_validation { self.errors.messages.delete :password_digest }

# Class methods:
  def self.search(query_term = nil)
    if query_term && query_term != ''
      self.where('name LIKE ?', "%#{query_term}%")
    else
      self.all
    end
  end

# Instance methods:
  def active?
    self.account_status == "active"
  end

  def feed
    Micropost.from_users_followed_by(self)
  end

  def following?(other_user)
    self.relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    self.relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    self.relationships.find_by_followed_id(other_user.id).destroy
  end

  def send_password_reset_email # called from Create action of PasswordResetsController
    self.password_reset_token = SecureRandom.urlsafe_base64
    self.password_reset_time = Time.zone.now
    self.save! validate: false
    UserMailer.password_reset(self).deliver
  end

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
    def create_account_activation_token
      self.account_activation_token = SecureRandom.urlsafe_base64
    end
end





