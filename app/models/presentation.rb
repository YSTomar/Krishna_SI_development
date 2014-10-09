class Presentation < ActiveRecord::Base
	
	attr_accessible :title, :description, :avatar, :user_id, :pre_logo
  
	belongs_to :user
	belongs_to :webnairs
	
	
	 
	has_attached_file :avatar#, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, :content_type => ["application/mspowerpoint","application/vnd.ms-powerpoint","application/vnd.openxmlformats-officedocument.presentationml.presentation"]
  
  
  has_attached_file :pre_logo, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :pre_logo, :content_type => /\Aimage\/.*\Z/
 
 def avatar_from_url(url)
    self.avatar = open(url)
 end
 
end
