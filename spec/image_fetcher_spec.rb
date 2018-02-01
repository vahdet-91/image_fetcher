RSpec.describe ImageFetcher do
	images_txt_file = File.join( File.dirname(__FILE__), 'fixtures/images.txt' )
	images_with_some_bad_urls = File.join( File.dirname(__FILE__), 'fixtures/images_with_some_bad_urls.txt' )

	after(:each) do
		clean_files_directory
	end

  it "Stores the images successfully" do
  	ImageFetcher.get_all_images(images_txt_file, File.join( File.dirname(__FILE__), 'files/'))
  	expect(image_count).to eq(8)
  end

  it "Stores only some images when some URLs are not valid" do
  	ImageFetcher.get_all_images(images_with_some_bad_urls, File.join( File.dirname(__FILE__), 'files/'))
  	expect(image_count).not_to eq(8)
  end

  it "Stores the images as GIF files" do
  	ImageFetcher.get_all_images(images_txt_file, File.join( File.dirname(__FILE__), 'files/'), "gif")
  	expect(get_image_types("gif").count).to eq(8)
  end
end

def get_image_types(type)
	extensions = []
	Dir.glob("#{File.join( File.dirname(__FILE__), 'files' )}/*.#{type}").map do |file|
    extensions << File.extname(file)
	end 
	extensions
end

def image_count
	dir = File.join( File.dirname(__FILE__), 'files/')
	Dir[File.join(dir, '**', '*')].count { |file| File.file?(file) }
end

def clean_files_directory
	dir = File.join( File.dirname(__FILE__), 'files/*')
	FileUtils.rm_rf(Dir.glob(dir))
end