class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items
         has_one :order
         has_one :address

         validates :email,                 presence: true, uniqueness: true, format: { with: /\A\S+@\S+\.\S+\z/ }
         validates :nickname,              presence: true
         validates :password,              presence: true, length: { minimum: 6 }, format: {with: /\A[a-z0-9]+\z/}
         validates :password_confirmation, presence: true, length: { minimum: 6 }, format: {with: /\A[a-z0-9]+\z/}
         validates :first_name,            presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
         validates :last_name,             presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
         validates :first_name_kana,       presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
         validates :last_name_kana,        presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
         validates :birth_day,             presence: true
end
