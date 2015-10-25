class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
    # GET /bookings
  # GET /bookings.json
  def index
    @rtype = RoomType.all
    if session.has_key?(:name) && session.has_key?(:id)
      @bookings = Booking.all
      @is_admin = true
    else
      redirect_to(:action => 'welcome')
    end
  end

  def welcome
    @rtype = RoomType.all
    @booking = Booking.new
    @room = Room.free
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
    @rtype = RoomType.all
    @booking = Booking.new(booking_params)
    if session.has_key?(:name) && session.has_key?(:id)
      respond_to do |format|
        if @booking.save
        @room = Room.all
        tmp = @booking['number']-1
        @room[tmp].status = true
        @room[tmp].save
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
          tmp = @booking['number']-1
          @room[tmp].status = true
          @room[tmp].save
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
      tmp = @booking['number']-1
      @room[tmp].status = false
      @room[tmp].save
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
