module YolQyWeixin
  module Connection
    module Message
      def send_message(body)
        http_post(send_url, body)
      end

      private

      def send_url
        "https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=#{get_access_token}&debug=1"
      end
    end
  end
end
