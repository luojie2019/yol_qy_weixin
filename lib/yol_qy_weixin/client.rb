require "monitor"
require "redis"
require 'digest/md5'
module YolQyWeixin
  class Client

    include Connection::Base
    include Connection::Qrcode
    include Connection::Template
    include Connection::User

    attr_accessor :corpid, :secret, :redis

    def initialize(options = {})
      @corpid = options[:corpid] || YolQyWeixin.configuration.corpid
      @secret = options[:secret] || YolQyWeixin.configuration.secret
      @redis  = options[:redis]  || YolQyWeixin.configuration.redis
    end
  end
end

# gem uninstall yol_qy_weixin
# gem build yol_qy_weixin     
# gem install ./yol_qy_weixin-0.0.1.gem
# require "yol_qy_weixin"
# qy_weixin = YolQyWeixin::Client.new(corpid: "wx6fcd91cc5993e305", secret: "-eE2GYJlqK1npg4_x6lj2PXIFD7gmLz7stqE6CCyj3s", redis: "")
# require 'net/http'
# require 'json'
# qy_weixin.get_user_info(333)