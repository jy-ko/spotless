require 'ice_cube'
require 'active_support/time'

class Task < ApplicationRecord
  belongs_to :room

  def set_cycle( number, frequency )
    schedule = IceCube::Schedule.new
    case frequency 
    when 'daily'
      schedule.add_recurrence_rule(IceCube::Rule.daily.count(number))
    when 'weekly'
      schedule.add_recurrence_rule(IceCube::Rule.weekly.count(number))
    when 'monthly'
      schedule.add_recurrence_rule(IceCube::Rule.monthly.count(number))
    end

    return schedule
  end

  def get_next_occurrence
    #if task has no occurences, schedule.next_occurrence(from_time)     # defaults to Time.now
    #if task has previous occurrence, 
  end


end
