module Dash
  class Packet
    attr_reader :sha, :spa, :tha, :tpa, :oper, :time

    def initialize(raw_packet)
      data_arr = raw_packet.data.unpack('C*')
      hex_data_arr = data_arr.map { |i| i.to_s(16) }.map { |i| i.length == 1 ? "0#{i}" : i }

      #sender hardware address
      @sha = hex_data_arr.slice(22,6).join(':')

      #sender protocol address
      @spa = data_arr.slice(28,4).join('.')

      #target hardware address
      @tha = hex_data_arr.slice(32,6).join(':')

      #target protocol address
      @tpa = data_arr.slice(38,4).join('.')

      #operation type. 1: request. 2: reply
      @oper = data_arr.slice(20,2).join.to_i

      @time = raw_packet.time

      #destination address (ethernet header)
      @dest = hex_data_arr.slice(0,6).join(':')

      #source address (ethernet header)
      @src = hex_data_arr.slice(6,6).join(':')
    end

    def to_s
      if @oper == 1
        "#{Time.at(@time)}: src: #{@src}. dst: #{@dest}. who has #{@tpa}? Tell #{@spa}"
      else
        "#{Time.at(@time)}: src: #{@src}. dst: #{@dest}. #{@spa} is at #{@sha}"
      end
    end

    def inspect
      {time: Time.at(@time), dest: @dest, src:@src, oper: @oper, sha: @sha, spa: @spa, tha: @tha, tpa: @tpa}
    end

  end
end
