def gen_redis_proto(*cmd)
  proto = ""
  proto << "*"+cmd.length.to_s+"\r\n"
  cmd.each { |arg|
    proto << "$"+arg.to_s.bytesize.to_s+"\r\n"
    proto << arg.to_s+"\r\n"
  }
  proto
end

puts gen_redis_proto("SET","mykey","Hello World!").inspect

