class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
has_many :items
has_many :order_histories



with_options presence: true do
  validates :nickname 
  validates :email
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[\w-]{6,128}+\z/i, message: "Include both letters and numbers" }
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters" }
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters" }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters" }
  validates :birthday
end
end