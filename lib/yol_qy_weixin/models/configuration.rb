module YolQyWeixin
  class Configuration

    OPTIONS = [:corpid, :secret, :redis].freeze

    attr_accessor :corpid

    attr_accessor :secret

    attr_accessor :redis

  end
end
