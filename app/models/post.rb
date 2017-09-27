class Post < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy

  mount_uploader :file, FileUploader
  validates :name, presence: true, format: { with: /\A[A-Z][a-z]+ [a-z]{2,}\.\z/,
                                             message: 'Minimum it should be 2 words with 2 letters each. Should also contain "." and first word should be capitalized.' }
  validate :size_validation

  private

  def size_validation
    errors[:file] << 'should be less than 2MB' if file.size > 2.megabytes
  end
end
