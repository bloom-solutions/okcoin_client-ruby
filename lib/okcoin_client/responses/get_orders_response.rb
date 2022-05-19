module OkcoinClient
  class GetOrdersResponse < BaseResponse

    attribute :body, Object, lazy: true, default: :default_body
    attribute :parsed_body, String, lazy: true, default: :default_parsed_body
    attribute :orders, Array, lazy: true, default: :default_orders

    private

    def default_success
      unless parsed_body.present?
        self.error_message = 'GetOrdersResponse: data not present'
        return false
      end
      raw_response.success?
    end

    def default_body
      raw_response.body
    end

    def default_parsed_body
      JSON.parse(body)
    end

    def default_orders
      parsed_body.map do |order_hash|
        Order.new(order_hash)
      end
    end

  end
end
