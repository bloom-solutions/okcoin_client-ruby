require "spec_helper"

RSpec.describe "Get orders history archive", vcr: { record: :once } do

  it "returns orders" do
    client = OkcoinClient.new(
      host: CONFIG[:host],
      key: CONFIG[:key],
      secret: CONFIG[:secret],
      passphrase: CONFIG[:passphrase],
    )

    response = client.get_orders_history_archive(
      inst_type: "SPOT",
      inst_id: "BTC-USD",
      ord_type: "market",
      state: "filled",
      limit: 5,
    )

    expect(response).to be_success, response.raw_response.body

    orders = response.orders

    expect(orders).not_to be_empty
    expect(orders.count).to be <= 5
    expect(orders.first).to be_a OkcoinClient::Order
    expect(orders.first.acc_fill_sz).to be_a String
  end

end
