class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :comments
  
  validates_presence_of :title, :description, :user_id, :event_id
  validates_numericality_of :latitude,
                            :allow_nil => true,
                            :allow_blank => true,
                            :greater_than_or_equal_to => -90.0,
                            :less_than_or_equal_to => 90.0,
                            :message => "is not a valid latitude"
  validates_numericality_of :longitude,
                            :allow_nil => true,
                            :allow_blank => true,
                            :greater_than_or_equal_to => -180.0,
                            :less_than_or_equal_to => 180.0,
                            :message => "is not a valid longitude"
  validates_numericality_of :user_id, :event_id,
                            :only_integer => true,
                            :greater_than => 0
end
