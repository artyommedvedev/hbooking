class RoomTypesController < ApplicationController
  before_action :set_room_type, only: [:show, :edit, :update, :destroy]

  # GET /room_types
  # GET /room_types.json
  def index
    @room_types = RoomType.all
  end

  # GET /room_types/1
  # GET /room_types/1.json
  def show
    if session.has_key?(:name) && session.has_key?(:id)

    else
      redirect_to(:action => 'index')
    end
  end

  # GET /room_types/new
  def new
    (session.has_key?(:name) && session.has_key?(:id)) ? @room_type = RoomType.new : redirect_to(:action => 'index')
  end

  # GET /room_types/1/edit
  def edit
    if session.has_key?(:name) && session.has_key?(:id)

    else
      redirect_to(:action => 'index')
    end
  end

  # POST /room_types
  # POST /room_types.json
  def create
    if session.has_key?(:name) && session.has_key?(:id)
      @room_type = RoomType.new(room_type_params)

      respond_to do |format|
        if @room_type.save
          format.html { redirect_to @room_type, notice: 'Room type was successfully created.' }
          format.json { render :show, status: :created, location: @room_type }
        else
          format.html { render :new }
          format.json { render json: @room_type.errors, status: :unprocessable_entity }
        end
      end

    else
      redirect_to(:action => 'index')
    end
  end

  # PATCH/PUT /room_types/1
  # PATCH/PUT /room_types/1.json
  def update
    if session.has_key?(:name) && session.has_key?(:id)
      respond_to do |format|
        if @room_type.update(room_type_params)
          format.html { redirect_to @room_type, notice: 'Room type was successfully updated.' }
          format.json { render :show, status: :ok, location: @room_type }
        else
          format.html { render :edit }
          format.json { render json: @room_type.errors, status: :unprocessable_entity }
        end
      end

    else
      redirect_to(:action => 'index')
    end

  end

  # DELETE /room_types/1
  # DELETE /room_types/1.json
  def destroy
    if session.has_key?(:name) && session.has_key?(:id)
      @room_type.destroy
        respond_to do |format|
        format.html { redirect_to room_types_url, notice: 'Room type was successfully destroyed.' }
        format.json { head :no_content }
      end

    else
      redirect_to(:action => 'index')
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_type
      @room_type = RoomType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_type_params
      params.require(:room_type).permit(:type_name)
    end
end
