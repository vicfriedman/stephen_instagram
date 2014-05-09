require'./lib/instagram_scraper.rb'
require './lib/twilio_texter.rb'

  task :check_most_recent_photo do 
    @instagram_scraper = InstagramScraper.new("30382525.77f4e65.aa6d929e0b6347fd908e58b2921324fb")
    user_id = @instagram_scraper.get_user_id
    all_pics = @instagram_scraper.get_pics(user_id.id)
    most_recent_created_time = all_pics.first.created_time.to_i
    created_ruby_time = Time.at(most_recent_created_time)
    if created_ruby_time > Time.now - 1*60 ##should prob. extract this out
      @twilio_texter = TwilioTexter.new
      @twilio_texter.text_me_instagram
    else
      puts all_pics.first
      puts "No new pictures"
    end
  end