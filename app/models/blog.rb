class Blog < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :title, length: { maximum: 80 }
  validates :content, presence: true
  validates :user_id, presence: true

  belongs_to :user


  def user_name(id)
  	User.find(id).name
  end
end