require 'rspec/core/rake_task'

namespace :spec do

  report_dir = "target/reports"
  directory report_dir

  spec_opts = ["--colour", "--profile"]

  rcov_report_dir = report_dir + "/rcov"
  rcov_opts = ["--exclude", "spec/*,gems/*,/System/*", "--rails", "-o " + rcov_report_dir]

  task :prepare => ["db:test:prepare"]

  desc "Run all specs in spec dir, excluding plugin specs"
  RSpec::Core::RakeTask.new(:all => :prepare) do |t|
    t.spec_opts = spec_opts
    t.pattern = 'spec/**/*_spec.rb'
  end

  desc "Run all specs in spec dir with RCov, excluding plugin specs"
  RSpec::Core::RakeTask.new(:all_with_reports => [:prepare, report_dir]) do |t|

    t.spec_opts = spec_opts + ["--format", "html", "--out", "#{report_dir}/spec.html"]
    t.pattern = 'spec/**/*_spec.rb'
    t.rcov = true
    t.rcov_opts = rcov_opts
  end

  desc "Print Specdoc for all specs"
  RSpec::Core::RakeTask.new(:doc) do |t|
    t.spec_opts = ["--format", "doc"]
    t.pattern = 'spec/**/*_spec.rb'
  end

  [:models, :controllers, :views, :helpers, :lib].each do |sub|
    desc "Run the specs under spec/#{sub}"
    RSpec::Core::RakeTask.new(sub => :prepare) do |t|
      t.spec_opts = spec_opts
      t.pattern = "spec/#{sub}/**/*_spec.rb"
    end
  end



end
