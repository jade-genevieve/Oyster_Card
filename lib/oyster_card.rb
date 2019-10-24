require_relative "journey"

class OysterCard
  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1

  attr_reader :balance, :station, :journeys, :journey

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
    @journey.finish(exit_station)
    @journeys << { entry_station: @journey.entry_station, exit_station: @journey.exit_station }
    @journey = Journey.new
  end

  def in_journey?
    !!@journey.entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
