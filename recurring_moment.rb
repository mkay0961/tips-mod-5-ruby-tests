require 'active_support'
require 'active_support/core_ext'


class RecurringMoment
  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end

  def match(date)
    current = @start
    i = 0
  
    while current < date
      if @period == 'monthly'
        i += @interval
        current = @start.advance(months: i)
      elsif @period == 'weekly'
        current = current.advance(weeks: @interval)
      elsif @period == 'daily'
        current = current.advance(days: @interval)
      end

      if current == date
        return true
      end
    end

    return false
  end


end
