class Book < ApplicationRecord
    validates :name, presence: true
    belongs_to :category, optional: true

end
