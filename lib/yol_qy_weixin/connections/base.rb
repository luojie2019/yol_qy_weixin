module YolQyWeixin
  module Connection
    module Base
      def http_post(url, params)
        uri = URI(url)
        req = Net::HTTP.new(uri.host, uri.port)
        req.use_ssl = true
        res = req.post("#{uri.path}?#{uri.query}", params.to_json)
        handle_res(res)
      end

      def http_get(url)
        uri = URI(url)
        req = Net::HTTP.new(uri.host, uri.port)
        req.use_ssl = true
        res = req.get("#{uri.path}?#{uri.query}")
        handle_res(res)
      end

      def get_access_token
        # access_token = redis.find("access_token_#{appid}")

        # if access_token.nil?
        #   access_token_res = get_token(corpid, secret)

        #   # TODO:
        #   access_token     = JSON.parse(access_token_res)["access_token"] rescue nil

        #   if access_token.nil?
        #     raise Exception.new("Weixin access token authorize false, appid: #{appid},
        #                          appsecret: #{appsecret}, access_token_res: #{access_token_res.to_s}")
        #   else
        #     redis.save("access_token_#{appid}", access_token)
        #     redis.expire("access_token_#{appid}", 7200)
        #   end
        # end

        # access_token
        access_token_res = get_token(corpid, secret)
        access_token     = access_token_res["access_token"] rescue nil
        access_token
      end

      private

      def get_token(app_id, app_secret)
        http_get(token_url(app_id, app_secret))
      end

      def token_url(corpid, secret)
        "https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=#{corpid}&corpsecret=#{secret}"
      end

      def handle_res(res)
        if res.code == '200'
          return JSON.parse(res.body)
        else
          return {:code => res.code}.to_json
        end
      end
    end
  end
end
