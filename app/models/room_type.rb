class RoomType < ActiveRecord::Base
  belongs_to :room

  validates :type_name, :presence => true, :length => { :maximum => 50 }

end
