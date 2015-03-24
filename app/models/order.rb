class Order < ActiveRecord::Base
	belongs_to :cart
  belongs_to :user
  validates :first_name,:last_name,:address,:landmark,:city,:pincode,:state, presence: true
  scope :guest_orders, lambda {where(:user_type => "Guest")}
  scope :user_orders, lambda {where(:user_type => "User")}
  validates :phone,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10 ,:maximum => 10 }
  validates :pincode,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 6 ,:maximum => 6 }
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ ,:presence => true
  validates :phone1,:allow_blank => true,
                 :numericality => true,
                 :length => { :minimum => 10 ,:maximum => 10 }
  validates :pincode1,:allow_blank => true,
                 :numericality => true,
                 :length => { :minimum => 6 ,:maximum => 6 }
  validate :validate_order

  def self.order_count(s_date)
    Order.where("date(created_at)=?", s_date).count
  end

  def validate_order
    p "********************"
    p self.same_as_billing
    if(self.same_as_billing == false && self.city1.blank? )
      errors.add(:same_as_billing, "Click on checkbox or fill up Shipping Address detail.").split("Same as billing")[0]
    end
  end

  def is_cancelled?
  	self.status == 'Cancelled'
  end

  def self.search(search)
  if search
    where('id LIKE ?', "%#{search}%")
  else
    Order.all
  end
end

end