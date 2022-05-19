module OkcoinClient
  class GetOrdersRequest < BaseRequest

    private

    def path
      "/api/spot/v3/orders"
    end

    def default_action
      :get
    end

    def params
      { state: state, limit: limit, instrument_id: instrument_id }
    end

  end
end
