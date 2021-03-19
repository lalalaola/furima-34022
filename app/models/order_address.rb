class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code,        format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id,      numericality: { other_than: 2, message: "Select"}
    validates :city
    validates :addresses
    validates :phone_number,       format: {with: /\A\d{10,11}\z/} 
    validates :token
  end

  def save
    #購入情報を保存し、変数orderに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    #住所を保存する。
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, user_id: user_id, order_id: order.id)
  end
end