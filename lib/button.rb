require_relative './packet.rb'

module Dash
  class Button

    SNAPLENGTH = 65535

    def initialize(*buttons, interface)
      @capture = PCAPRUB::Pcap.open_live(interface, SNAPLENGTH, true, 0)
      set_filter('arp')
      @last_packet = nil
      @buttons = buttons
    rescue => e
      raise "Failed to initiate pcap lib. #{e.message}", e.backtrace
    end

    def set_filter(type)
      @capture.setfilter(type)
    rescue => e 
      raise "Failed to set filter. #{e.message}", e.backtrace
    end

    def on_pressed
      @capture.each_packet do |raw_packet|
        packet = Packet.new(raw_packet)
        if !duplicate? && @buttons.include?(packet.sha)
          @last_packet = Time.now
          yield packet if block_given?
        end
      end
    rescue Interrupt => e
      puts "\nAborting..."
    end

    def duplicate?
      @last_packet && (Time.now - @last_packet) < 1
    end

  end
end

