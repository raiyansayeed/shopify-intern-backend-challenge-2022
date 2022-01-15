class Product < ApplicationRecord
  extend FriendlyId

  belongs_to :seller
  has_many :inventories, dependent: :destroy

  friendly_id :name, use: :slugged

  accepts_nested_attributes_for :inventories, reject_if: :all_blank, allow_destroy: true
  validates_associated :inventories

  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 500 }
end
