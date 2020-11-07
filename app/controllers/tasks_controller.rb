class TasksController < ApplicationController
    before_action :set_room, only: [ :new, :create, :edit, :update, :destroy ]
    before_action :set_task, only: [ :edit, :update, :destroy]
   

    def new
      @task = Task.new
    end

    def edit
    end
  
    def create
      @task= Task.new(task_params)
      @task.room = @room
      respond_to do |format|
        if @task.save
          format.html { redirect_to @room, notice: 'Task was successfully created.' }
          format.json { render :show, status: :created, location: @room }
        else
          format.html { render :new }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @task.update(task_params)
          format.html { redirect_to @room, notice: 'Task was successfully updated.' }
          format.json { render :show, status: :ok, location: @room }
        else
          format.html { render :edit }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @task.destroy
      respond_to do |format|
        format.html { redirect_to @room, notice: 'Room was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_task
        @task = Task.find(params[:id])
      end

      def set_room
        @room = Room.find(params[:room_id])
      end

      # Only allow a list of trusted parameters through.
      def task_params
        params.require(:task).permit(:name)
      end
    

end