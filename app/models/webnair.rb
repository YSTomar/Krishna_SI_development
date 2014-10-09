class Webnair < ActiveRecord::Base
   
	attr_accessible :title, :description, :choice, :ppt, :user_id, :presentation_id, :avatar
	
	
	belongs_to :user
	has_one :presentation	 
	has_attached_file :ppt#, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :ppt, :content_type => ["application/mspowerpoint","application/vnd.ms-powerpoint","application/vnd.openxmlformats-officedocument.presentationml.presentation"]
	# validates :title, :description, :choice, presence: true
	#validates :title, uniqueness: true
  	#validates :ppt, :attachment_presence => true

  # before_save :check_presentation
 
  # def check_presentation
  # pre = Presentation.find(['presentation_id'])
  # puts pre.inspect
  #  if self.presentation_id = pre
  #      self.ppt_file_name = pre.avatar_file_name
  #      self.ppt_content_type = pre.avatar_content_type
  #      self.ppt_file_size = pre.avatar_file_size
  #   end
  # end
  
#   
    # def check_presentation 
   # if self.presentation_id
     # presentation = Presentation.where(:id=>presentaion_id).first
       # self.ppt_file_name = presentation.avatar_file_name
       # self.ppt_content_type = presentation.avatar_content_type
       # self.ppt_file_size = presentation.avatar_file_size
    # end
  # end
end