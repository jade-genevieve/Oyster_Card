class Journey
  attr_reader :entry_station, :exit_station
  PENALTY_FARE = 6
  STANDARD_FARE = 1

  def initialize
    @entry_station
    @exit_station
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
  end

  def fare
    return PENALTY_FARE if incomplete?
    STANDARD_FARE
  end

  def incomplete?
    entry_station.nil? || exit_station.nil?
  end
end
