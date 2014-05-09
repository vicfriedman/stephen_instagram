require 'twilio-ruby'
class TwilioTexter

def text_me_instagram
  account_sid = ENV['TWILIO-SID']
  auth_token = ENV['TWILIO-TOKEN']
  @client = Twilio::REST::Client.new account_sid, auth_token
  @instagram_scraper = InstagramScraper.new(ENV['INSTAGRAM_AUTH'])
  user_id = @instagram_scraper.get_user_id
  all_pics = @instagram_scraper.get_pics(user_id.id)
  most_recent_pic = all_pics.first
  @client.account.messages.create(
    :from => '18152642023',
    :to => '+14344661525',
    :body => "Stephen uploaded a photo to instagram. #{most_recent_pic.images.standard_resolution.url}",
  )
end


end
