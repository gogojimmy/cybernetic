#encoding: utf-8
class Store < ActiveRecord::Base
  attr_accessible :address, :email, :name, :store_type, :tel, :url

  STORE_TYPES = %w( 獨立店 3C賣場 生活賣場 網路賣場 其他 )
  validates_presence_of :name
end
