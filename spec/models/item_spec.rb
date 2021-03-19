require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  it "全ての項目の入力が存在すれば登録できること" do
    expect(@item).to be_valid
  end

  #入力がないと登録ができないこと

  it "imageが空では登録ができないこと" do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include( "Image can't be blank")
  end

  it "nameが空では登録ができないこと" do
    @item.name = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end
  
  it "infoが空では登録ができないこと" do
    @item.info = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Info can't be blank")
  end

  it "category_idが未選択では登録ができないこと" do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Category Select")
  end

  it "sales_status_idが未選択では登録ができないこと" do
    @item.sales_status_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Sales status Select")
  end

  it "shipping_fee_status_idが空では登録ができないこと" do
    @item.shipping_fee_status_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping fee status Select")
  end

  it "prefecture_idが空では登録ができないこと" do
    @item.prefecture_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture Select")
  end

  it "scheduled_delivery_idが空では登録ができないこと" do
    @item.scheduled_delivery_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Scheduled delivery Select")
  end

  it "priceが空では登録ができないこと" do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end

  it "priceが全角数字だと出品できない" do
    @item.price = "１"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number")
  end

  it "priceが299円以下だと出品できない" do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
  end

  it "priceが10000000以上だと出品できない" do
    @item.price = 10000000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
  end
end
