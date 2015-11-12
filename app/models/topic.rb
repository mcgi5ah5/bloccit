class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  belongs_to :user

  scope :visible_to, -> (user) { user ? all : where(public: true) }

  scope :publicly_viewable, -> (topic) {topic ? all : where(public: true)}

  scope :privately_viewable, -> (topic) {topic ? all : where(public: false)}

  self.per_page = 50
end
