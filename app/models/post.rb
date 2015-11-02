class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :user
  belongs_to :topic
  mount_uploader :image , ImageUploader

  def up_votes
    self.votes.where(value:1).count
  end

  def down_votes
    self.votes.where(value:-1).count
  end

  def points
    self.votes.sum(:value).to_i
  end

  def update_rank
     age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
     new_rank = points + age_in_days
 
     update_attribute(:rank, new_rank)
   end

  default_scope { order('rank DESC') }

  validates :title, length: {minimum: 5}, presence: true
  validates :body , length: {minimum: 20}, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  def save_with_initial_vote
    ActiveRecord::Base.transaction do
      self.save
      user.votes.create(value: 1, post: post)
  end

end
