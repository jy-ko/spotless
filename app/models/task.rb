require 'ice_cube'
require 'active_support/time'

class Task < ApplicationRecord
  belongs_to :room
  delegate :user, :to => :room, :allow_nil => true
  serialize :recurring, Hash

  validates :name, length: { minimum: 3 }, presence: true
  validates :room_id, presence: true

  def recurring=(value)
    if RecurringSelect.is_valid_rule?(value)
      super(RecurringSelect.dirty_hash_to_rule(value).to_hash)
    else
      super(nil)
    end

  end
  
  def rule
    IceCube::Rule.from_hash recurring
  end

  def schedule(start)
    schedule = IceCube::Schedule.new(start)
    schedule.add_recurrence_rule(rule)
    schedule
  end

  def calendar_tasks(start)
    if recurring.empty?
      [self]
    else
      # start_date = start.beginning_of_month.beginning_of_week
      end_date = start.end_of_month.end_of_week
      schedule(start_time).occurrences(end_date).map do |date|
        Task.new(id: id, name: name, start_time: date)
      end
    end
  end

  def get_todays_list(tasks)
    tasks.occurs_on?(Date.today)
  end

end