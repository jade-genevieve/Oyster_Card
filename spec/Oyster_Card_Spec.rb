require 'oyster_card'

describe OysterCard do
  subject {OysterCard.new}

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it "It should allow the customer to add funds to the card" do
    expect { subject.top_up 1}.to change{subject.balance }.by 1
  end

  it "has a balance of zero" do
    expect(subject.balance).to eq(0)
  end

  it 'raises an error if the maximum balance is exceeded' do
    maximum_balance = OysterCard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect{ subject.top_up 1 }.to raise_error 'Maximum balance exceeded'
  end

end
