class OysterCard
  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1

  attr_reader :balance, :station, :journeys

  def initialize
    @balance = 0
    @station
    @journeys = []
  end

  def top_up(amount)
    fail "Maximum balance exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    fail "Insufficient balance to touch in" if balance < MINIMUM_CHARGE
    @station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_CHARGE)
    journeys << {
      entry_station: @station,
      exit_station: exit_station,
    }
    @station = nil
  end

  def in_journey?
    !!station
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
