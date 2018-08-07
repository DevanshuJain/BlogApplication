class Post < ApplicationRecord
  belongs_to :blog
  has_many :comments, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy



  
scope :published, -> { 
 where(:published => true)
}
end
