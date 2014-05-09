require 'twilio-ruby'
class TwilioTexter

def text_me_instagram
  account_sid = 'ACe330ba04d082392df4cb3511dcb72cec'
auth_token = '2008ea097713e401a16c54029058da82'
  @client = Twilio::REST::Client.new account_sid, auth_token
  @instagram_scraper = InstagramScraper.new("30382525.77f4e65.aa6d929e0b6347fd908e58b2921324fb")
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
