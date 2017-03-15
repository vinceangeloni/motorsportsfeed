namespace :bgTasks do
  task refresh_feeds: :environment do
    puts "Refreshing feeds..."
    Feed.refresh_feeds
  end
end