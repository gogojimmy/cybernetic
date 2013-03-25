class ContactNoticeMailer < ActionMailer::Base
  default from: 'service@cybernetic.com.tw'
  def send_contact_notice_mail
    mail to: 'service@cybernetic.com.tw', subject: '意見提醒'
  end
end
