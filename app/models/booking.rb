class Booking < ActiveRecord::Base
  belongs_to :room

  @@rooms = Array.new

  validates_presence_of :number
  validates_numericality_of :number
  validates_presence_of :begining
  validates_presence_of :ending
  validates :cost, numericality: { greater_than: 0 }, presence: true
  validate :number_must_exist
  validate :dates_correct


  def number_must_exist
    unless @@rooms.include? self.number
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

    year_now = Date.today.year
    if d_st.year > year_now
      d_st_mod = d_st.yday + 365
    else
      d_st_mod = d_st.yday
    end

    if d_end.year > year_now
      d_end_mod = d_end.yday + 365
    else
      d_end_mod = d_end.yday
    end

    all_bookings.each do |b|

        if b[:begining].year > year_now
          b_st_mod = b[:begining].yday + 365
        else
          b_st_mod = b[:begining].yday
        end
        if b[:ending].year > year_now
          b_end_mod = b[:ending].yday + 365
        else
          b_end_mod = b[:ending].yday
        end

      #------------------
        if ((b_st_mod...b_end_mod) === d_st_mod) ||
            ((b_st_mod...b_end_mod) === d_end_mod)
          if room_numbers.include? (b[:number])
            room_numbers.delete(b[:number])
          end
        end

        if (b_st_mod >= d_st_mod) && (b_end_mod <= d_end_mod)
          if room_numbers.include? (b[:number])
            room_numbers.delete(b[:number])
          end
        end

=begin
        if ((b[:begining].yday...b[:ending].yday) === d_st.yday) ||
            ((b[:begining].yday...b[:ending].yday) === d_end.yday)
          if room_numbers.include? (b[:number])
            room_numbers.delete(b[:number])
          end
        end
        #
        if (b[:begining].yday >= d_st.yday) && (b[:ending].yday <= d_end.yday)
          if room_numbers.include? (b[:number])
            room_numbers.delete(b[:number])
          end
        end
=end
      end
     #in array room_numbers left only available for booking for selected date
    @@rooms = room_numbers
    return room_numbers
  end
end


