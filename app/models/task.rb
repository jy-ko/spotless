require 'ice_cube'
require 'active_support/time'

class Task < ApplicationRecord
  belongs_to :room

  def set_cycle( number, frequency )

    schedule = IceCube::Schedule.new
    case frequency 
    when 'daily'
      schedule.add_recurrence_rule(IceCube::Rule.daily.count(number))
    end

    return schedule

  end

end
