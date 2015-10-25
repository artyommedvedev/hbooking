class Room < ActiveRecord::Base
  has_one :room_type
  has_many :bookings

  validates_uniqueness_of :number
  validates_presence_of :number
  validates_presence_of :type_id
  validates_inclusion_of :status, :in => [true, false]
  validates_presence_of :price

  scope :free, -> { where(:status => false) }

end
