class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :posts
  has_many :events
  
  validates_presence_of :title, :description#, :user_id
  #validates_numericality_of :user_id,
  #                          :only_integer => true,
  #                          :greater_than => 0
  #validates_numericality_of :event_id,
  #                          :allow_nil => true,
  #                          :allow_blank => true,
  #                          :only_integer => true,
  #                          :greater_than => 0
end
