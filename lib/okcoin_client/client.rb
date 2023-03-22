module OkcoinClient
  class Client

    include APIClientBase::Client.module(default_opts: :default_opts)

    api_action :get_orders_history
    api_action :get_orders_history_archive

    attribute :host, String
    attribute :key, String
    attribute :secret, String
    attribute :passphrase, String

    private

    def default_opts
      { host: host, key: key, secret: secret, passphrase: passphrase }
    end

  end
end
