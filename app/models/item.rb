class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :charge
  belongs_to_active_hash :days, foreign_key: 'date_id'
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :image
    validates :item_name, length: { maximum: 40, message: '商品名は40字までです' }
    validates :summary, length: { maximum: 1000, message: '商品の説明は1000字までです' }
    validates :price, numericality: { only_integer: true, message: '半角数字のみを使用してください' },
                      inclusion: { in: 300..9_999_999, message: 'は¥300から¥9,999,999までです' }
    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :charge_id
      validates :prefecture_id
      validates :date_id
    end
  end
end
