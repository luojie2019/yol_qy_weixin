module YolQyWeixin
  module Connection
    module User
      def get_user_id(code)
        http_get(user_info_url(open_id))
      end

      def get_user_info(open_id)
        http_get(user_info_url(open_id))
      end

      private

      def user_id_url(code)
        "https://qyapi.weixin.qq.com/cgi-bin/user/getuserinfo?access_token=#{get_access_token}&code=#{code}"
      end

      def user_info_url(open_id)
        "https://qyapi.weixin.qq.com/cgi-bin/user/get?access_token=#{get_access_token}&userid=#{open_id}"
      end
    end
  end
end
