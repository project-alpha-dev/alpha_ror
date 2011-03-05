task :before_commit => ["spec:covered", :quality, :cucumber]
