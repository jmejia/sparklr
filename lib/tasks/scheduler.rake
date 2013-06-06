desc "This task is called by the Heroku scheduler add-on"
task :send_reminders => :environment do
  puts "Sending reminders..."
  ReminderForUsersWorker.perform_async
  puts "done."
end
