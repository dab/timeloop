require "rubygems"
require "bundler/setup"


match "/timeloop.manifest" => Rails::Offline

Offline = Rack::Offline.configure do

  public_path = "/"
  Dir[public_path.join("assets/*.*")].each do |file|
    cache file.relative_path_from(public_path)
  end

  network "/"
end

run Rack::Directory.new("/Users/dab/dev/timetracker/html/")
