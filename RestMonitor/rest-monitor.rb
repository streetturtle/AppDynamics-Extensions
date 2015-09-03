#!/usr/bin/ruby

require 'rubygems'
require 'net/http'
require 'net/https'
require 'json'

def printMetric(metric, value)
    printf("name=Custom Metrics|Users|%s, value=%d\n", metric, value)
end

url  = "https://myawesomeapp.com/service/api/getStatistics.json"
uri = URI.parse(url)

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(uri.request_uri)
request.basic_auth 'admin', '123'

res = http.request(request)

resJson = JSON.parse(res.body)
qty = resJson['users']['online']
printMetric('online', qty)
