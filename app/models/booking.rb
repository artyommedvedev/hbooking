class Booking < ActiveRecord::Base
  belongs_to :room
  belongs_to :person


  validates_presence_of :number
  validates_numericality_of :number
  validates_presence_of :begining
  validates_presence_of :ending
  validates :cost, numericality: { greater_than: 0 }, presence: true
  validate :number_must_exist
  validate :dates_correct


  def number_must_exist
    names_array = Array.new
    all_rooms=Room.free
    names_array = all_rooms.pluck(:number)
    unless names_array.include? self.number
    errors.add(:number, "Must exist")
    end
  end

  def dates_correct
    if self.begining < Date.today() || self.ending < Date.tomorrow() || self.begining>self.ending
          errors.add(:number, "Select correct date")
    end
  end

end


