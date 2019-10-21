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

end
