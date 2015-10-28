class Booking < ActiveRecord::Base
  belongs_to :room
  validates_presence_of :number
  validates_numericality_of :number
  validates_presence_of :begining
  validates_presence_of :ending
  validates :cost, numericality: { greater_than: 0 }, presence: true
  #validate :number_must_exist
  validate :dates_correct

  def number_must_exist
    unless room_numbers.include? self.number
    errors.add(:number, 'Must exist')
    end
  end

  def dates_correct
    if self.begining < Date.today || self.ending < Date.tomorrow || self.begining>self.ending
          errors.add(:number, 'Select correct date')
    end
  end

  def self.allowed_for_booking (d_st,d_end)
    all_rooms = Room.all
    room_numbers = all_rooms.pluck(:number)
    all_bookings = Booking.all
    all_bookings.each do |b|
      if ((b[:begining].yday...b[:ending].yday) === d_st.yday) ||
          ((b[:begining].yday...b[:ending].yday) === d_end.yday)
        if room_numbers.include? (b[:number])
          room_numbers.delete(b[:number])
        end
      end
    end
    #in array room_numbers left only available for booking for selected date
    return room_numbers
  end
end


