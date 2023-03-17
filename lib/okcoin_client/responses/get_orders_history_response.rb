module OkcoinClient
  class GetOrdersHistoryResponse < BaseResponse

    attribute :body, Object, lazy: true, default: :default_body
    attribute :parsed_body, String, lazy: true, default: :default_parsed_body
    attribute :orders, Array, lazy: true, default: :default_orders

    private

    def default_success
      return false if error_message.present?
      return false if parsed_body.empty?

      raw_response.success?
    end

    def default_body
      raw_response.body
    end

    def default_parsed_body
      JSON.parse(body)
    rescue JSON::ParserError => e
      {}
    end

    def default_orders
      return [] if not self.success?

      parsed_body["data"].map do |order_hash|
        Order.new(raw_hash: order_hash)
      end
    end

  end
end
