class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :favorites, dependent: :destroy

  has_many :active_relationships, foreign_key: :follower_id,
           class_name: Relationship, dependent: :destroy
  has_many :followings, through: :active_relationships

  has_many :passive_relationships, foreign_key: :following_id,
           class_name: Relationship, dependent: :destroy
  has_many :followers, through: :passive_relationships

  mount_uploader :image, ImageUploader

  def followed_by? user
    passive_relationships.where(follower_id: user.id).exists?
  end

end
