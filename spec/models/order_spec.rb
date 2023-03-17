RSpec.describe OkcoinClient::Order do
  it "has the right attributes" do
    order_hash = {
      "accFillSz" => "0.0212",
      "avgPx" => "27614.246132075471698",
      "cTime" => "1679293694317",
      "category" => "normal",
      "ccy" => "",
      "clOrdId" => "",
      "fee" => "-0.00002968",
      "feeCcy" => "BTC",
      "fillPx" => "27619.04",
      "fillSz" => "0.0002",
      "fillTime" => "1679293694321",
      "instId" => "BTC-USD",
      "instType" => "SPOT",
      "lever" => "",
      "ordId" => "557933424560574464",
      "ordType" => "market",
      "pnl" => "0",
      "posSide" => "",
      "px" => "",
      "rebate" => "0",
      "rebateCcy" => "USD",
      "reduceOnly" => "false",
      "side" => "buy",
      "slOrdPx" => "",
      "slTriggerPx" => "",
      "slTriggerPxType" => "",
      "source" => "",
      "state" => "filled",
      "sz" => "586.52",
      "tag" => "Paxman",
      "tdMode" => "cash",
      "tgtCcy" => "quote_ccy",
      "tpOrdPx" => "",
      "tpTriggerPx" => "",
      "tpTriggerPxType" => "",
      "tradeId" => "14508585",
      "uTime" => "1679293694907"
    }

    order = described_class.new(raw_hash: order_hash)

    expect(order.acc_fill_sz).to eq "0.0212"
    expect(order.rebate).to eq "0"
    expect(order.u_time).to eq "1679293694907"
  end
end
