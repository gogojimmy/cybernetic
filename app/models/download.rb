class Download < ActiveRecord::Base
  attr_accessible :description, :name, :file

  translates :name, :description

  mount_uploader :file, FileUploader
  validates_presence_of :name, :file

end
