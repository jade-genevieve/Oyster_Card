require_relative "journey"

class OysterCard
  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1

  attr_reader :balance, :station, :journeys

  def initialize(journey = Journey.new)
    @balance = 0
    @station
    @journeys = []
    @journey = journey
  end

  def top_up(amount)
    fail "Maximum balance exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    fail "Insufficient balance to touch in" if balance < MINIMUM_CHARGE
    @journey.start(entry_station)
  end

  def touch_out(exit_station)
    deduct(MINIMUM_CHARGE)
    # journeys << {
    #   entry_station: @station,
    #   exit_station: exit_station,
    # }
    # @station = nil
    @journey.finish(exit_station)
    @journey = nil
  end

  def in_journey?
    !!station
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end

# require_relative 'journey'

# class Oystercard
#   attr_reader :balance, :journey
#   MAX_BALANCE = 90
#   MIN_BALANCE = 1

#   def initialize
#     @balance = 0
#     @journey = Journey.new
#   end

#   def top_up(value)
#     raise "Max balance £#{MAX_BALANCE} will be exceeded" if max_reached?(value)

#     @balance += value
#   end

#   def touch_in(station)
#     raise 'Cannot touch in: Not enough funds' if balance < MIN_BALANCE
#     deduct if in_journey?
#     @journey.start(station)
#   end

#   def touch_out(station)
#     @journey.end(station)
#     deduct
#     @journey.reset
#   end

#   def in_journey?
#     @journey.current_journey[:entry] != nil
#   end

#   private

#   def max_reached?(value)
#     @balance + value > MAX_BALANCE
#   end

#   def deduct
#     @balance -= @journey.fare
#   end
# end
