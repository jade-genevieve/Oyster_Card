describe OysterCard do
  subject {OysterCard.new}

it "It should allow the customer to add funds to the card" do
  expect(subject.add_funds(10)).to eq 10
end

end
