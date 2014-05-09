require'./lib/instagram_scraper.rb'
require './lib/twilio_texter.rb'

  task :check_most_recent_photo do 
    @instagram_scraper = InstagramScraper.new(ENV['ACCESS_TOKEN'])
    user_id = @instagram_scraper.get_user_id
    all_pics = @instagram_scraper.get_pics(user_id.id)
    most_recent_created_time = all_pics.first.created_time.to_i
    created_ruby_time = Time.at(most_recent_created_time)
    if created_ruby_time > Time.now - 10*60 ##should prob. extract this out
      @twilio_texter = TwilioTexter.new
      @twilio_texter.text_me_instagram
    else
      puts all_pics.first
      puts "No new pictures"
    end
  end