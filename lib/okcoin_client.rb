require "okcoin_client/version"
require "api_client_base"
require "dry-validation"

require "json"
require "active_support/core_ext/hash/indifferent_access"
require "openssl"
require "addressable"

require "okcoin_client/client"
require "okcoin_client/models/order"
require "okcoin_client/requests/base_request"
require "okcoin_client/requests/get_orders_history_request"
require "okcoin_client/responses/base_response"
require "okcoin_client/responses/get_orders_history_response"
require "okcoin_client/schemas/base_request_schema"
require "okcoin_client/schemas/get_orders_history_request_schema"

module OkcoinClient
  include APIClientBase::Base.module

  with_configuration do
    has :host, classes: String
    has :key, classes: String
    has :secret, classes: String
    has :passphrase, classes: String
  end
end
