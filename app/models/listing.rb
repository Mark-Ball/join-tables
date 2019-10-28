class Listing < ApplicationRecord
    has_many :colors_listings, dependent: :destroy
    has_many :colors, through: :colors_listings
end
