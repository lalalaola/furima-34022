class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :order
  belongs_to :user
    
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :scheduled_delivery
  belongs_to_active_hash :prefecture

  validates :name,                    presence: true, length: { maximum: 40 }
  validates :info,                    presence: true, length: { maximum: 1000 }
  validates :category_id,             presence: true, inclusion: { in: 2..11, message: "Select"}
  validates :sales_status_id,         presence: true, inclusion: { in: 2..7, message: "Select"}
  validates :shipping_fee_status_id,  presence: true, inclusion: { in: 2..3, message: "Select"}
  validates :scheduled_delivery_id,   presence: true, inclusion: { in: 2..4, message: "Select"}
  validates :prefecture_id,           presence: true, inclusion: { in: 2..48, message: "Select"}
  validates :price,                   presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ }
  validates :image,                   presence: true

end
