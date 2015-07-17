class ContactMailer < ActionMailer::Base
  default from: ENV['MAIL_SENDER_EMAIL_ADDRESS']

  def contact_email(content)
    @content = content
    mail(to: ENV['MAIL_SYSTEM_ADMIN'], subject: "Site Contact Submission: #{@content["title"]["title"]} ")
  end
end
