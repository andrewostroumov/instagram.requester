class InstagramRequesterClient
  TRUSTED_ANDROID_USER_AGENT = "23/6.0.1; 640dpi; 1440x2560; samsung; SM-G935F; hero2lte; samsungexynos8890; ru_RU"
  INSTAGRAM_URL = "https://i.instagram.com/api"

  def initialize(logger = nil)
    @http = http_client
    @logger = logger
  end

  def make_requests(count)
    count.times do
      response = @http.get("#{INSTAGRAM_URL}/v1/si/fetch_headers/")
      @logger.info("Instagram Response status: #{response.status} content-type: #{response.content_type} proxy: #{@http.proxy}")
      @logger.info(response.body)
      sleep(rand(15))

      if rand(100) < 10
        raise HTTPClient::ConnectTimeoutError.new("Unable to connect to Instagram")
      end
    end
  end

  private

  def http_client
    client = HTTPClient.new(client_config)
    client.connect_timeout = 10
    client.send_timeout = 20
    client.receive_timeout = 15
    client.transparent_gzip_decompression = true
    client.force_basic_auth = true
    client
  end

  def client_config
    {
      default_header: {
        "User-Agent": TRUSTED_ANDROID_USER_AGENT
      }
    }
  end
end