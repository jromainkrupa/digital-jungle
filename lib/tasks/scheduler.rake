desc "This task is called by the Heroku scheduler add-on"
task :update_slack_messages => :environment do
  puts "retrieving and storing messages..."
  Project.all.each do |project|
    FetchMessagesFromProjectJob.perform_later(project, 10)
  end
  puts "done."
end
