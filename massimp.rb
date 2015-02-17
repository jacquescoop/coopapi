require 'rubygems'
require 'pp'

def gen_redis_proto(*cmd)
  proto = ""
  proto << "*"+cmd.length.to_s+"\r\n"
  cmd.each { |arg|
    proto << "$"+arg.to_s.bytesize.to_s+"\r\n"
    proto << arg.to_s+"\r\n"
  }
  proto
end

arg1 = "" ## les arguments passés pour chq ligne

File.readlines('./ListeCoop.txt').each do |line|
  ##pp line
  @arg1 = line.split("*")
  puts gen_redis_proto(@arg1[0],@arg1[1],@arg1[2]).inspect
end

