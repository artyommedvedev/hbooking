class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
    # GET /bookings
  # GET /bookings.json
  def index
    @rtype = RoomType.all
    if session.has_key?(:name) && session.has_key?(:id)
      @bookings = Booking.all
    else
      redirect_to(:action => 'welcome')
    end
  end

  def welcome
    @booking = Booking.new
  end

  def available
    d_st = params[:d_st]
    @ds = Date.new(d_st['(1i)'].to_i, d_st['(2i)'].to_i, d_st['(3i)'].to_i)

    d_end = params[:d_en]
    @de = Date.new(d_end['(1i)'].to_i, d_end['(2i)'].to_i, d_end['(3i)'].to_i)

    @bookings = Booking.new
    @rtypes = RoomType.all
    @rooms = Room.find(Booking.allowed_for_booking(@ds,@de))
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @rtype = RoomType.all
    if session.has_key?(:name) && session.has_key?(:id)

    else
      redirect_to(:action => 'welcome')
    end

  end

   # GET /bookings/new
  def new
    @rtype = RoomType.all
    if session.has_key?(:name) && session.has_key?(:id)
      @booking = Booking.new
    else
      redirect_to(:action => 'welcome')
    end
  end

  # GET /bookings/1/edit
  def edit
    if session.has_key?(:name) && session.has_key?(:id)

    else
      redirect_to(:action => 'welcome')
    end
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @r_type = RoomType.all
    @booking = Booking.new(booking_params)
    if session.has_key?(:name) && session.has_key?(:id)
      respond_to do |format|
        if @booking.save
        @room = Room.all
      #  tmp = @booking['number']-1
       # @room[tmp].status = true
       # @room[tmp].save
          format.html { render :show , notice: 'Booking was successfully created.' }
          format.json { render :show , status: :created, location: @booking }
        else
          @room = Room.all
          format.html { render :new }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if @booking.save
          @room = Room.all
        #  tmp = @booking['number']-1
        #  @room[tmp].status = true
        #  @room[tmp].save
          @room = Room.free
          format.html { render :welcome, notice: 'Booking was successfully created.' }
          format.json { render :welcome, status: :created, location: @booking }
        else
          @room = Room.free
          format.html { render :welcome }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end
      end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    if session.has_key?(:name) && session.has_key?(:id)
      respond_to do |format|
        if @booking.update(booking_params)
          format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
          format.json { render :show, status: :ok, location: @booking }
        else
          format.html { render :edit }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end

    else
      redirect_to(:action => 'welcome')
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    if session.has_key?(:name) && session.has_key?(:id)
      @booking.destroy
      @room = Room.all
     # tmp = @booking['number']-1
     # @room[tmp].status = false
     # @room[tmp].save
      respond_to do |format|
        format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to(:action => 'welcome')
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:number, :begining, :ending, :cost)
    end
end
