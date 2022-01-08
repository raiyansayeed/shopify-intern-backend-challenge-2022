class Seller < ApplicationRecord
    has_many :products

    validates :name, presence: true, length: { maximum: 100 } 

end
