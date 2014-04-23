module ActOn
  module Configurable

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
      self
    end

    CONFIG_KEYS = [
      :url,
      :access_token,
      :client_id,
      :client_secret,
      :username,
      :password,
    ] unless defined? CONFIG_KEYS
    attr_accessor *CONFIG_KEYS

    class << self
      def keys
        @keys ||= CONFIG_KEYS
      end
    end

    # Delegate to a ActOn::Client
    #
    # @return [ActOn::Client]
    def client(options={})
      ::ActOn::Client.new(options)
    end
  end
end