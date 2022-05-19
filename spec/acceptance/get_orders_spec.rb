require "spec_helper"

RSpec.describe "Get orders", vcr: { record: :none } do

  it "returns orders" do
    client = OkcoinClient.new(
      host: CONFIG[:host],
      key: CONFIG[:key],
      secret: CONFIG[:secret],
      passphrase: CONFIG[:passphrase],
    )

    get_orders_response = client.get_orders(instrument_id: "BTC-USD")

    expect(get_orders_response.orders).not_to be_empty
    expect(get_orders_response.orders.first.class).to eq OkcoinClient::Order
  end

end
