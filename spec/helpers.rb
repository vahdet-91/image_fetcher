module Helpers
	def self.get_image_types(type)
		extensions = []
		Dir.glob("#{File.join( File.dirname(__FILE__), 'files' )}/*.#{type}").map do |file|
    	extensions << File.extname(file)
		end 
		extensions
	end

	def self.image_count
		dir = File.join( File.dirname(__FILE__), 'files/')
		Dir[File.join(dir, '**', '*')].count { |file| File.file?(file) }
	end

	def self.clean_files_directory
		dir = File.join( File.dirname(__FILE__), 'files/*')
		FileUtils.rm_rf(Dir.glob(dir))
	end
end