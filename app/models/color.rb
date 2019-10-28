class Color < ApplicationRecord
    has_many :colors_listings
    has_many :listings, through: :colors_listings
end
