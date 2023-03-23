module OkcoinClient
  class BaseRequest

    include APIClientBase::Request

    attribute :key, String
    attribute :secret, String
    attribute :passphrase, String

    DIGEST = OpenSSL::Digest.new("sha256")
    TIMESTAMP_FORMAT = "%FT%T.%LZ".freeze

    private

    def headers
      method = action.to_s.upcase

      data = _timestamp + method + _request_path

      signature = Base64.strict_encode64(
        OpenSSL::HMAC.digest(DIGEST, secret, data)
      )

      {
        "Content-Type" => "application/json",
        "OK-ACCESS-KEY" => key,
        "OK-ACCESS-SIGN" => signature,
        "OK-ACCESS-TIMESTAMP" => _timestamp,
        "OK-ACCESS-PASSPHRASE" => passphrase,
      }
    end

    private

    def _request_path
      return @request_path if @request_path

      request_path = Addressable::URI.parse(path)

      # params must be ordered alphabetically so that
      # the path generated here matches the path that typhoeus sends
      # to OKCoin, and the signatures will match
      request_path.query_values = params

      @request_path = request_path.to_s
    end

    def _timestamp
      @timestamp ||= Time.now.utc.strftime(TIMESTAMP_FORMAT)
    end

  end
end
