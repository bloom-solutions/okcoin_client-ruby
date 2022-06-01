RSpec.describe OkcoinClient::Order do
  it "has the right attributes" do
    order_hash = {
      "client_oid": "",
      "created_at": "2022-05-17t06:13:47.552z",
      "fee": "-0.00042",
      "fee_currency": "btc",
      "filled_notional": "9105.212502",
      "filled_size": "0.3",
      "funds": "",
      "instrument_id": "btc-usd",
      "notional": "",
      "order_id": "01292391999",
      "order_type": "0",
      "price": "30359.9",
      "price_avg": "30350.7",
      "product_id": "btc-usd",
      "rebate": "",
      "rebate_currency": "",
      "side": "buy",
      "size": "0.3",
      "state": "2",
      "status": "filled",
      "timestamp": "2022-05-17t06:13:47.552z",
      "type":"limit",
    }

    order = described_class.new(order_hash)

    expect(order.order_id).to eq "01292391999"
  end
end
