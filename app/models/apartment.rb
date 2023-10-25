class Apartment < ApplicationRecord
    belongs_to :user
    validates :street,  presence: true 
    validates :unit,  presence: true 
    # validates :city,  presence: true 
    # validates :state,  presence: true 
    # validates :square_footage,  presence: true 
    # validates :bathrooms,  presence: true 
    # validates :bedrooms,  presence: true 
    # validates :pets,  presence: true 
    # validates :image,  presence: true 
    # validates :price,  presence: true 
    # validates :user_id,  presence: true 
    
end




