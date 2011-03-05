desc "code quality checks"
task :quality => "quality:default"

namespace :quality do
  task :default => [:metric_fu]

  source_file_globs = ["app/**/*.rb", "lib/*.rb", "lib/**/*.rb"]

  task :metric_fu do
  
  end

end
