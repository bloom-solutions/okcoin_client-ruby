module OkcoinClient
  class BaseResponse

    include APIClientBase::Response.module

    attribute :body, Object, lazy: true, default: :default_body
    attribute :parsed_body, String, lazy: true, default: :default_parsed_body
    attribute :error_message, String, lazy: true

    private

    def default_body
      raw_response.body
    end

    def default_parsed_body
      JSON.parse(body).with_indifferent_access
    end

  end
end
