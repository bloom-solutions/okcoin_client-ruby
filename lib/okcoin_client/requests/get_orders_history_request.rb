module OkcoinClient
  class GetOrdersHistoryRequest < BaseRequest

    attribute :inst_type, String
    attribute :inst_id, String
    attribute :ord_type, String
    attribute :state, String
    attribute :after, String
    attribute :before, String
    attribute :limit, Integer, default: 100

    private

    def path
      "/api/v5/trade/orders-history"
    end

    def default_action
      :get
    end

    def params
      {
        after: after,
        before: before,
        instId: inst_id,
        instType: inst_type,
        limit: limit,
        ordType: ord_type,
        state: state,
      }.delete_if { |key, value| value.blank? }
    end

  end
end
