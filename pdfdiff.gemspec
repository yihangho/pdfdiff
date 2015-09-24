Gem::Specification.new do |s|
  s.name        = "pdfdiff"
  s.version     = "0.0.1"
  s.summary     = "diff - for PDFs"
  s.description = "Compute the differences between two PDF files"
  s.author      = "Yihang Ho"
  s.email       = "me@yihangho.com"
  s.files       = ["bin/pdfdiff"]
  s.license     = "MIT"
  s.executables = ["pdfdiff"]
  s.homepage    = "https://github.com/yihangho/pdfdiff"

  s.add_runtime_dependency("mini_magick", "~> 4.3.3")
end
