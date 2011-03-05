require 'metric_fu'

MetricFu::Configuration.run do |config|
  config.metrics  = [:churn, :flog, :flay, :reek, :roodi, 
    :saikuro, :hotspots, :stats, :rails_best_practices]
  config.graphs   = [:flog, :flay, :reek, :roodi, :stats, :rails_best_practices]
  config.base_directory = 'target/metrics'
  config.scratch_directory = File.join(config.base_directory, 'scratch')
  config.output_directory  = File.join(config.base_directory, 'output')
  config.data_directory    = File.join(config.base_directory, '_data')
end

desc "code quality checks"
task :quality => "quality:default"

namespace :quality do
  task :default => ["spec:covered", :metric_fu]

  source_file_globs = ["app/**/*.rb", "lib/*.rb", "lib/**/*.rb"]

  task :metric_fu => ["metrics:all"]

end
