class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :sub_categories, :dependent => :destroy
  has_many :parent_sub_categories, :dependent => :destroy

  has_attached_file :avatar, :styles => {:thumb => "900x674>"} 
  validates_attachment_content_type :avatar,
  :content_type => [ 'image/jpeg','image/jpg', 'image/png', 'image/gif','image/bmp', 'image/x-png', 'image/pjpeg' ]
  
  validates_attachment_size(:avatar, :less_than => 10.megabytes)

   def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end
end