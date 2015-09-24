require "mini_magick"
require "securerandom"
require "fileutils"

def workdir(*paths)
  unless @workdir
    @workdir = "/tmp/#{SecureRandom.uuid}"
    @workdir = "/tmp/#{SecureRandom.uuid}" while File.exists?(@workdir)
  end

  File.join(@workdir, *paths)
end

FileUtils.mkdir(workdir)
FileUtils.mkdir(workdir("input1"))
FileUtils.mkdir(workdir("input2"))
FileUtils.mkdir(workdir("output"))

converter = MiniMagick::Tool::Convert.new
converter << "sample_new.pdf"
converter << workdir("input1", "page.png")
converter.call

converter = MiniMagick::Tool::Convert.new
converter << "sample_old.pdf"
converter << workdir("input2", "page.png")
converter.call

merger = MiniMagick::Tool::Convert.new

index = 0
while File.exists?(workdir("input1", "page-#{index}.png")) && File.exists?(workdir("input2", "page-#{index}.png"))
  compare = MiniMagick::Tool::Compare.new
  compare << workdir("input1", "page-#{index}.png")
  compare << workdir("input2", "page-#{index}.png")
  compare << workdir("output", "page-#{index}.png")
  compare.call(false)

  merger << workdir("output", "page-#{index}.png")

  index += 1
end

merger << "result.pdf"
merger.call

FileUtils.rm_rf(workdir)
