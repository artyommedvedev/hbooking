class Room < ActiveRecord::Base
  has_one :room_type
  has_many :bookings

  validates_uniqueness_of :number
  validates_presence_of :number
  validates_presence_of :type_id
  validates_inclusion_of :status, :in => [true, false]
  validates_presence_of :price

  scope :free, -> { where(:status => false) }

=begin
  def allowed_for_booking (d_st,d_end)
    ##set room.status = free if nobody book the room for this period
    all_rooms = Room.all
    room_numbers = all_rooms.pluck(:number)

    all_rooms.each() do |room|
      #finding all entries of booking for this room
      currentBooking = room.bookings.find # Booking.all
      currentBooking.each do |cb|
        if (d_st < cb[:ending] || d_end > cd[:begining])
          if room_numbers.include? (cb[:number])
            room_numbers - cb[:number]
          end
        end
      end
    end

    #in array room_numbers left only available for booking for selected date
    return room_numbers
  end
=end

end
