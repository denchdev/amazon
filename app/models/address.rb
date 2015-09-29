class Address < ActiveRecord::Base
  belongs_to :country
  belongs_to :order
  belongs_to :customer

  validates_presence_of :address, :zipcode, :city, :phone, :country
  validates :zipcode, format: {with: /\A[0-9]{5}\z/, message: "should contain 5 digits"}

  def eq(address)
    unless self.id && address.id && self.id == address.id
      fields_to_eq = [:address, :zip_code, :city, :phone, :country]

      fields_to_eq.each do |field|
        return false if self[field] != address[field]
      end
    end

    true
  end

  def country_name
    c = ISO3166::Country[country]
    c.translations[I18n.locale.to_s] || c.name
  end
end
