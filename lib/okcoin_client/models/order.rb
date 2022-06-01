module OkcoinClient
  class Order

    include Virtus.model

    attribute :client_oid, Integer
    attribute :created_at, Integer
    attribute :fee, Float
    attribute :fee_currency, String
    attribute :filled_notional, Float
    attribute :filled_size, Float
    attribute :funds, Integer
    attribute :instrument_id, String
    attribute :notional, String
    attribute :order_id, String
    attribute :order_type, Integer
    attribute :price, Float
    attribute :price_avg, Float
    attribute :product_id, String
    attribute :rebate, String
    attribute :rebate_currency, String
    attribute :side, String
    attribute :size, Float
    attribute :state, Integer
    attribute :status, String
    attribute :timestamp, Integer
    attribute :type, String

  end
end
