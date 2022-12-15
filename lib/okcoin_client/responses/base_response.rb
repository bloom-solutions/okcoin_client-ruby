module OkcoinClient
  class BaseResponse

    include APIClientBase::Response.module

    attribute :body, Object, lazy: true, default: :default_body
    attribute :parsed_body, String, lazy: true, default: :default_parsed_body
    attribute :error_message, String, lazy: true, default: :default_error_message

    ERROR_MESSAGE_KEY = "error_message".freeze

    private

    def default_body
      raw_response.body
    end

    def default_parsed_body
      JSON.parse(body).with_indifferent_access
    end

    def default_error_message
      if parsed_body.blank?
        "response empty; no error present"
      else
        error_messages = parsed_body.each_with_object([]) do |element, arr|
          next if not element.is_a?(Array)
          next if element[0] != ERROR_MESSAGE_KEY

          arr << element[1]
        end

        error_messages.join("; ")
      end
    end

  end
end
