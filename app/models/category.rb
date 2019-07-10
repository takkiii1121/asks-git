class Category < ApplicationRecord
    validates :name, length: {maximum: 50}
    
    # has_many :asks
end
