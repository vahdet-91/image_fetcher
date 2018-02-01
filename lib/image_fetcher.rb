require "image_fetcher/version"
require 'open-uri'
require 'uri'
require 'timeout'

module ImageFetcher
 def self.get_all_images(file, write_path = "", ext = "png")
		File.open(file, 'r').each_line do |line|
			begin
				encoded_url = URI.parse(URI.encode(line.chomp))
				file_name = DateTime.now.strftime('%Q')
  			Timeout::timeout(10) do
          open(encoded_url) do |uri|
  		      open("#{write_path}#{file_name}.#{ext}", "wb") do |file|
     			    file.write(uri.read)
     			  end
  		    end
        end
  		rescue Timeout::Error, Net::OpenTimeout, SocketError => e
  			e.message
			end
  	end
	end
end