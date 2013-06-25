class Blog < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :user_id
  validates_uniqueness_of :title
  validates_length_of :title, maximum:180

  
end
