class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable
     

   has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing-user.png"
   validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/  
  
  has_many :orders

  validates :first_name, :last_name, :presence => true
end