class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  helper_method :mobile?
  def index
    @rooms = policy_scope(Room)
    @tasks = current_user.tasks
    @calendar_tasks = @tasks.flat_map { |t| t.calendar_tasks(params.fetch(:start_date, Time.current).to_date)}
    @todays_tasks = @calendar_tasks.select { |task| task.start_time.strftime("%Y%m%d") == Date.current.strftime("%Y%m%d") }
  end

  def show
  end

  def new
    @room = Room.new
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
        format.html { render :_new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

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

  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_room
      @room = policy_scope(Room).find(params[:id])
      authorize @room
    end

    def room_params
      params.require(:room).permit(:name, :user_id)
    end
    def mobile? # has to be in here because it has access to "request"
      request.user_agent =~ /\b(Android|iPhone|iPad|Windows Phone|Opera Mobi|Kindle|BackBerry|PlayBook)\b/i
   end
end
