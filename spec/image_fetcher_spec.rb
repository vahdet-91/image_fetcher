RSpec.describe ImageFetcher do
	before(:all) do
		@images_txt_file = File.join( File.dirname(__FILE__), 'fixtures/images.txt' )
		@images_with_some_bad_urls = File.join( File.dirname(__FILE__), 'fixtures/images_with_some_bad_urls.txt' )
		@directory_store_files = File.join( File.dirname(__FILE__), 'files/')
	end

	after(:each) do
		Helpers.clean_files_directory
	end

  it "Stores the images successfully" do
  	ImageFetcher.get_all_images(@images_txt_file, @directory_store_files)
  	expect(Helpers.image_count).to eq(8)
  end

  it "Stores only some images when some URLs are not valid" do
  	ImageFetcher.get_all_images(@images_with_some_bad_urls, @directory_store_files)
  	expect(Helpers.image_count).not_to eq(8)
  end

  it "Stores the images as GIF files" do
  	ImageFetcher.get_all_images(@images_txt_file, File.join( File.dirname(__FILE__), 'files/'), "gif")
  	expect(Helpers.get_image_types("gif").count).to eq(8)
  end
end