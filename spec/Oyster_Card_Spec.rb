require "oyster_card"

describe OysterCard do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey) {
    {
      entry_station: entry_station,
      exit_station: exit_station,
    }
  }

  before(:each) do
    subject.top_up(1)
  end

  # it { is_expected.to respond_to(:top_up).with(1).argument }

  # it "has an empty list of journeys by default" do
  #   expect(subject.journeys).to be_empty
  # end

  # it "stores a journey" do
  #   subject.touch_in(entry_station)
  #   subject.touch_out(exit_station)
  #   expect(subject.journeys).to include journey
  # end

  # it "It should allow the customer to add funds to the card" do
  #   expect { subject.top_up 1 }.to change { subject.balance }.by 1
  # end

  # it "has a balance of zero" do
  #   subject2 = OysterCard.new
  #   expect(subject2.balance).to eq(0)
  # end

  # it "raises an error if the maximum balance is exceeded" do
  #   maximum_balance = OysterCard::MAXIMUM_BALANCE
  #   expect { subject.top_up maximum_balance }.to raise_error "Maximum balance exceeded"
  # end

  # it "is initially not in a journey" do
  #   expect(subject).not_to be_in_journey
  # end

  # describe "#touch_in" do
  #   it "can touch in" do
  #     subject.touch_in(entry_station)
  #     expect(subject).to be_in_journey
  #   end

  #   it "deducts minimum charge" do
  #     subject.top_up(1)
  #     subject.touch_in(entry_station)
  #     expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-OysterCard::MINIMUM_CHARGE)
  #   end

  #   it "stores the entry station" do
  #     subject.touch_in(entry_station)
  #     expect(subject.station).to eq entry_station
  #   end

  #   context "oystercard is below minimum balance" do
  #     it "will not touch in" do
  #       subject.touch_out(exit_station)
  #       expect { subject.touch_in(entry_station) }.to raise_error "Insufficient balance to touch in"
  #     end
  #   end
  # end

  # describe "#touch_out" do
  #   it "can touch out" do
  #     subject.top_up(1)
  #     subject.touch_in(entry_station)
  #     subject.touch_out(exit_station)
  #     expect(subject).not_to be_in_journey
  #   end

  #   it "stores exit station" do
  #     subject.touch_in(entry_station)
  #     subject.touch_out(exit_station)
  #     expect(subject.journeys).to eq([{ :entry_station => entry_station, :exit_station => exit_station }])
  #   end
  # end
end
