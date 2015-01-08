worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 15
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end







$ heroku rake db:create
heroku run rake
heroku open
bundle update
git push heroku master
heroku run rake db:migrate
bundle install
git push heroku master
git add -A
git commit -m "remove gem"
git push origin heroku master
git push heroku master
git status

git checkout master
git stash
rails s
git checkout new
git merge -s ours master
git checkout master
git merge new
git add -A
git commit -m"remove gem test"
git push heroku master
 heroku apps:rename line-up
 heroku run rails console 
 $ heroku run -a line-up console
heroku logs
heroku logs --source app


vim config fucked me up when I removed every line referencing heroku!