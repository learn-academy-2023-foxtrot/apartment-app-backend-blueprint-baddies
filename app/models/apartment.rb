class Apartment < ApplicationRecord
    belongs_to :user
    validates :street, :unit, :city, :state, :square_footage, :bathrooms, :bedrooms, :pets, :image,:price, presence: true 
end
