class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :name, presence: true, format: { with: /\A[A-Z][a-z]+ [a-z]{2,}\.\z/,
                                             message: 'Minimum it should be 2 words with 2 letters each. Should also contain "." and first word should be capitalized.' }
end
