require "lensman/version"
require "lensman/configuration"

module Lensman
  def self.record(type, identity, details)
    conn = Faraday.new(url: Lensman.configuration.url) do |c|
      c.token_auth(Lensman.configuration.api_key)
      c.adapter :net_http
    end

    conn.post(
      '/records',
      type: type,
      identity: identity,
      page: details[:page],
      original: details[:original],
      result: details[:result],
      other: details[:other]
    )
  end
end
