class Product < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
  mount_uploader :avatar, AvatarUploader

  belongs_to :category
  has_many :lots, dependent: :destroy
  has_many :pictures, as: :imageable

  #attr_accessible :pictures_attributes
  accepts_nested_attributes_for :pictures

  validates :title, presence: true, uniqueness: true, length: { in: 4..120 }
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0.01}
  validates :category, presence: true
end
