class Quote < ApplicationRecord
    has_many :comments
    validates :title, presence: true, length: {minimum: 5, maximum: 50}
    validates :body, presence: true, length: {maximum: 20000}
end
