class PurchaseRecordAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :purchase_record_id, :postal_code,
                :prefecture_id, :city, :house_number, :building_name,
                :phone_number
  
  with_options presence: true do
    validates :purchase_record_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid. Don't include hyphen(-)"}
    validates :item_id
    validates :user_id
  end

  def save
    purchase_record = Purchase_record.create(item_id: item_id, user_id: user_id)
    Address.create(purchase_record_id: purchase_record.id, postal_code: postal_code, city: city, house_number: house_number,
                   building_name: building_name, phone_number: phone_number)
  end
end