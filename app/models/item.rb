class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days
  belongs_to :user

  has_one_attached :image
  #has_one :order_history


  validates :image, :name, :description, :category_id, :status_id, :delivery_cost_id, :prefecture_id, :days_id, presence: true
  
  with_options presence: true do
    validates :price, numericality: { only_integer: true, message: "Half-width number"}
  end
  validates_inclusion_of :price, in: 300..9999999, message: "Out of setting range"

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :delivery_cost_id
    validates :prefecture_id
    validates :days_id

  end




end

