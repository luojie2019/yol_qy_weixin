require 'roxml'
require 'multi_xml'
require 'ostruct'

require "yol_qy_weixin/version"

require "yol_qy_weixin/models/configuration"
require "yol_qy_weixin/models/encrypt_message"
require "yol_qy_weixin/models/message"
require "yol_qy_weixin/helpers/prpcrypt"

require "yol_qy_weixin/connection"
require "yol_qy_weixin/client"

module YolQyWeixin

  class << self

    # A YolQyWeixin configuration object. See YolQyWeixin::Configuration.
    attr_writer :configuration

    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end

  end
end
