# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contact < ActiveRecord::Base
  attr_accessible :content, :email, :name
  after_create :send_mail

  def send_mail
    ContactNoticeMailer.send_contact_notice_mail.deliver
  end
end
