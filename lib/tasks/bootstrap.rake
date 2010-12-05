namespace :db do
  desc "Bootstrap dev env"
  task :bootstrap => ['db:migrate:reset', 'db:seed']

  namespace :bootstrap do
    desc "Bootstrap dev env to last production (MySQL)"
    task :import => [:environment, 'db:drop', 'db:create'] do
      config = ActiveRecord::Base.configurations[RAILS_ENV]
      system("mysql --user=#{config['username']} --password=#{config['password']} #{config['database']} < db/#{RAILS_ENV}_seed.sql")
      Rake::Task['db:migrate'].invoke  
    end
  end
end
