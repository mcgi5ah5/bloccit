class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  belongs_to :user

  self.per_page = 50
end
