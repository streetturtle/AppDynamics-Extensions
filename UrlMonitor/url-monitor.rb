require 'open-uri'
require 'openssl'
require 'net/http'

def printMetric(metric, value)
    printf("name=Custom Metrics|Urls|%s, value=%d\n", metric, value)
end

def getRespCode(url)
  uri = URI.parse(url)

  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(uri.request_uri)

  res = http.request(request)
end

appPage1 = 'https://myAppPage1.com/'
appPage2 = 'https://myAppPage2.com/'

printMetric('/app1', getRespCode(appPage1).code)
printMetric('/app2', getRespCode(appPage2).code)
