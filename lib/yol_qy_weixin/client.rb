require "monitor"
require "redis"
require 'digest/md5'
module YolQyWeixin
  class Client

    include Connection::Base
    include Connection::Qrcode
    include Connection::Template
    include Connection::User
    include Connection::Department
    
    attr_accessor :corpid, :secret, :redis

    def initialize(options = {})
      @corpid = options[:corpid] || YolQyWeixin.configuration.corpid
      @secret = options[:secret] || YolQyWeixin.configuration.secret
      @redis  = options[:redis]  || YolQyWeixin.configuration.redis
    end
  end
end
