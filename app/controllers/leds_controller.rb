class LedsController < ApplicationController
	before_filter :initialize_io, :only => [:turn_on_led, :turn_off_led]
	
	GREEN_LED = 0
	RED_LED = 7

	def index
		
	end
	
	def turn_on_led
		led = @leds[params[:led_color].to_sym]
		@io.write(led, 1)
		render :json => {:status => "true"}	
	end	
	
	def turn_off_led
		led = @leds[params[:led_color].to_sym]
                @io.write(led, 0)		
		render :json => {:status => "true"}	
	end	

	private
	
	def initialize_io
		@io = WiringPi::GPIO.new
		@io.mode(GREEN_LED, OUTPUT)
		@io.mode(RED_LED, OUTPUT)
		@leds = {:green => GREEN_LED, :red => RED_LED}
	end
end
