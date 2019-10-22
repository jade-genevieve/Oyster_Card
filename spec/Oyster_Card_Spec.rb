require "oyster_card"

describe OysterCard do
  let(:station) { double :station }

  before(:each) do
    subject.top_up(1)
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it "It should allow the customer to add funds to the card" do
    expect { subject.top_up 1 }.to change { subject.balance }.by 1
  end

  it "has a balance of zero" do
    subject2 = OysterCard.new
    expect(subject2.balance).to eq(0)
  end

  it "raises an error if the maximum balance is exceeded" do
    maximum_balance = OysterCard::MAXIMUM_BALANCE
    expect { subject.top_up maximum_balance }.to raise_error "Maximum balance exceeded"
  end

  it "is initially not in a journey" do
    expect(subject.in_journey).to be false
  end

  describe "#touch_in" do
    it "can touch in" do
      subject.touch_in(station)
      expect(subject.in_journey).to be true
    end

    context "oystercard is below minimum balance" do
      it "will not touch in" do
        subject.touch_out
        expect { subject.touch_in(station) }.to raise_error "Insufficient balance to touch in"
      end
    end
  end

  describe "#touch_out" do
    it "can touch out" do
      subject.top_up(1)
      subject.touch_in(station)
      subject.touch_out
      expect(subject.in_journey).to be false
    end

    it "deducts minimum charge" do
      subject.top_up(1)
      subject.touch_in(station)
      expect { subject.touch_out }.to change { subject.balance }.by(-OysterCard::MINIMUM_CHARGE)
    end

    it "stores the entry station" do
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end
  end
end
