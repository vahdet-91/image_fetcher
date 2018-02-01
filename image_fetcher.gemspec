
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "image_fetcher/version"

Gem::Specification.new do |spec|
  spec.name          = "image_fetcher"
  spec.version       = "0.0.1"
  spec.authors       = ["Vahdet Pervan"]
  spec.email         = ["veeuoh@hotmail.co.uk"]

  spec.summary       = "A module that downloads images through URLs from a txt file."
  spec.description   = "This gem has one module with one function that takes three arguments. The first argument is a txt file that contains the URLs of the images, the second argument is the directory of where you would like to store your images (default path is the one where the module is being called), the third argument is the file extension you would like for your images (default value is gif)"
  spec.homepage      = "https://github.com/vahdet-91/image_fetcher.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
