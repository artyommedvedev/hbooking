class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    if session.has_key?(:name) && session.has_key?(:id)
      @rooms = Room.all
      @is_admin = true
    else
      @rooms = Room.free
      @is_admin = false
    end
  end

  #def available
   # @rooms = Room.find(allowed_for_booking(@booking[:begining],@booking[:ending]))
   # @is_admin = false
  #end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    if session.has_key?(:name) && session.has_key?(:id)

    else
      redirect_to(:action => 'index')
    end
  end

  # GET /rooms/new
  def new
    if session.has_key?(:name) && session.has_key?(:id)
    @room = Room.new

    else
      redirect_to(:action => 'index')
    end
  end

  # GET /rooms/1/edit
  def edit
    if session.has_key?(:name) && session.has_key?(:id)

    else
      redirect_to(:action => 'index')
    end
  end

  # POST /rooms
  # POST /rooms.json
  def create
    if session.has_key?(:name) && session.has_key?(:id)
      @room = Room.new(room_params)

      respond_to do |format|
        if @room.save
          format.html { redirect_to @room, notice: 'Room was successfully created.' }
          format.json { render :show, status: :created, location: @room }
        else
          format.html { render :new }
          format.json { render json: @room.errors, status: :unprocessable_entity }
        end
      end

    else
      redirect_to(:action => 'index')
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    if session.has_key?(:name) && session.has_key?(:id)
      respond_to do |format|
        if @room.update(room_params)
          format.html { redirect_to @room, notice: 'Room was successfully updated.' }
          format.json { render :show, status: :ok, location: @room }
        else
          format.html { render :edit }
          format.json { render json: @room.errors, status: :unprocessable_entity }
        end
      end

    else
      redirect_to(:action => 'index')
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    if session.has_key?(:name) && session.has_key?(:id)
      @room.destroy
      respond_to do |format|
        format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
        format.json { head :no_content }
      end

    else
      redirect_to(:action => 'index')
    end
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:number, :type_id, :price, :status)
    end
end
