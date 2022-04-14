class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:landing]
  skip_after_action :verify_policy_scoped, :only => [:landing, :index]
  def index
    @rooms = policy_scope(Room)
    @tasks = current_user.tasks
    @calendar_tasks = @tasks.flat_map { |t| t.calendar_tasks(params.fetch(:start_date, Time.current).to_date)}
    @todays_tasks = @calendar_tasks.select { |task| task.start_time.strftime("%Y%m%d") == Date.current.strftime("%Y%m%d") }
  end
end
