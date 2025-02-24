class PurchaseRecordAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :purchase_record_id, :postal_code,
                :prefecture_id, :city, :house_number, :building_name,
                :phone_number, :token
  
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "must be in format '###-####'"}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid. Input only number with 10 to 11 digits"}
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    ActiveRecord::Base.transaction do
      purchase_record = PurchaseRecord.create!(
        item_id: item_id,
        user_id: user_id
      )
  
      Address.create!(
        purchase_record_id: purchase_record.id,
        postal_code: postal_code,
        prefecture_id: prefecture_id,
        city: city,
        house_number: house_number,
        building_name: building_name,
        phone_number: phone_number
      )
      true
    rescue ActiveRecord::RecordInvalid
      false
    end
  end
end