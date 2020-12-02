class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = policy_scope(Room)
    @tasks = policy_scope(Task)
    @calendar_tasks = @tasks.flat_map { |t| t.calendar_tasks(params.fetch(:start_date, Time.current).to_date)}
    @todays_tasks = @calendar_tasks.select { |task| task.start_time.strftime("%Y%m%d") == Date.current.strftime("%Y%m%d") }
  end

  def show
  end

  def new
    @room = current_user.rooms.new
    authorize @room
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
  end

  def create
    @room = current_user.rooms.new(room_params)
    authorize @room
    respond_to do |format|
      if @room.save
        format.html { redirect_to rooms_path, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = policy_scope(Room).find(params[:id])
      authorize @room
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name)
    end
end
