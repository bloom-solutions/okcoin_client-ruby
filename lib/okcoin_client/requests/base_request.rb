module OkcoinClient
  class BaseRequest

    include APIClientBase::Request

    attribute :key, String
    attribute :secret, String
    attribute :passphrase, String
    attribute :state, Integer, default: 7
    attribute :limit, Integer, default: 100
    attribute :instrument_id, String

    DIGEST = OpenSSL::Digest::Digest.new("sha256")
    METHOD = "GET"

    private

    def headers
      timestamp = Time.now.to_f.round(3).to_s

      signature = Base64.strict_encode64(
        OpenSSL::HMAC.digest(
          DIGEST,
          secret,
          timestamp + METHOD + "#{path}?state=#{state}&limit=#{limit}&instrument_id=#{instrument_id}"
        )
      )

      {
        "OK-ACCESS-KEY" => key,
        "OK-ACCESS-SIGN" => signature,
        "OK-ACCESS-TIMESTAMP"  => timestamp,
        "OK-ACCESS-PASSPHRASE"  => passphrase,
      }
    end

  end
end
