class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :series_requests,
           foreign_key: 'requester_id',
           class_name: 'SeriesRequest'
  has_many :series_invitations,
           foreign_key: 'receiver_id',
           class_name: 'SeriesRequest'
  has_and_belongs_to_many :series
  mount_uploader :avatar, PictureUploader
  has_many :roles

end
