# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
   
admin = Admin.new(:email => 'admin@gmail.com', :password => '123123123',
:password_confirmation => '123123123')
admin.save(:validate => false)
Admin.first.update_attributes(first_name: "Sara", last_name: "Fanning")
#Pending, Success, Shipped, Cancelled, Returned
#Possible Action for Admin Guest Order => Shipped, Returned
#Possible Action for Admin User Order => Shipped, Returned
#Possible Action for Guest Order => Pending, Success
#Possible Action for User Order => Pending, Success, Cancelled

#>>Pending is the status when order is created with billing && shipping information
#but they have not confirm their order yet
#once they confirm their order, status becomes Success
#later we need to remove all color + product_colors 

# Category.find_or_create_by(:name => "Bed and bath")

Category.find_or_create_by(:name => "Bed")
Category.find_or_create_by(:name => "Bath")
Category.find_or_create_by(:name => "Curtains")
Category.find_or_create_by(:name => "Furniture")
Category.find_or_create_by(:name => "Cushions")
Category.find_or_create_by(:name => "Decor")
Category.find_or_create_by(:name => "Kids")
Category.find_or_create_by(:name => "Sale")

# @cat1 = Category.find_by_name('Bed and bath') 
# ParentSubCategory.find_or_create_by(:name => "Bed linen", :category_id => @cat1.id)
# ParentSubCategory.find_or_create_by(:name => "Bath linen", :category_id => @cat1.id)

# @psc1 = ParentSubCategory.find_by_name("Bed linen")
# @psc2 = ParentSubCategory.find_by_name("Bath linen")

# SubCategory.find_or_create_by(:name => "Bed sheets", :parent_sub_category_id => @psc1.id, :category_id => @cat1.id)
# SubCategory.find_or_create_by(:name => "Bed in a bag",  :parent_sub_category_id => @psc1.id, :category_id => @cat1.id)
# SubCategory.find_or_create_by(:name => "Bed covers",  :parent_sub_category_id => @psc1.id, :category_id => @cat1.id)
# SubCategory.find_or_create_by(:name => "Comforters",  :parent_sub_category_id => @psc1.id, :category_id => @cat1.id)
# SubCategory.find_or_create_by(:name => "Duvet covers",  :parent_sub_category_id => @psc1.id, :category_id => @cat1.id)
# SubCategory.find_or_create_by(:name => "Diwan sets",  :parent_sub_category_id => @psc1.id, :category_id => @cat1.id)
# SubCategory.find_or_create_by(:name => "Pillow and inserts ",  :parent_sub_category_id => @psc1.id, :category_id => @cat1.id)
@cat1a = Category.find_by_name('Bed')
SubCategory.find_or_create_by(:name => "Bed sheets", :category_id => @cat1a.id)
SubCategory.find_or_create_by(:name => "Bed in a bag", :category_id => @cat1a.id)
SubCategory.find_or_create_by(:name => "Bed covers", :category_id => @cat1a.id)
SubCategory.find_or_create_by(:name => "Comforters", :category_id => @cat1a.id)
SubCategory.find_or_create_by(:name => "Duvet covers", :category_id => @cat1a.id)
SubCategory.find_or_create_by(:name => "Diwan sets", :category_id => @cat1a.id)
SubCategory.find_or_create_by(:name => "Pillow and inserts", :category_id => @cat1a.id)

# SubCategory.find_or_create_by(:name => "Towels",  :parent_sub_category_id => @psc2.id, :category_id => @cat1.id)
# SubCategory.find_or_create_by(:name => "Bath robes",  :parent_sub_category_id => @psc2.id, :category_id => @cat1.id)
# SubCategory.find_or_create_by(:name => "Bath rugs",  :parent_sub_category_id => @psc2.id, :category_id => @cat1.id)
# SubCategory.find_or_create_by(:name => "Bath mats",  :parent_sub_category_id => @psc2.id, :category_id => @cat1.id)
# SubCategory.find_or_create_by(:name => "Shower curtains",  :parent_sub_category_id => @psc2.id, :category_id => @cat1.id)
# SubCategory.find_or_create_by(:name => "Bathroom accessories",  :parent_sub_category_id => @psc2.id, :category_id => @cat1.id)
# SubCategory.find_or_create_by(:name => "Mirrors",  :parent_sub_category_id => @psc2.id, :category_id => @cat1.id)
@cat1b = Category.find_by_name('Bath')
SubCategory.find_or_create_by(:name => "Towels", :category_id => @cat1b.id)
SubCategory.find_or_create_by(:name => "Bath robes", :category_id => @cat1b.id)
SubCategory.find_or_create_by(:name => "Bath rugs", :category_id => @cat1b.id)
SubCategory.find_or_create_by(:name => "Bath mats", :category_id => @cat1b.id)
SubCategory.find_or_create_by(:name => "Shower curtains", :category_id => @cat1b.id)
SubCategory.find_or_create_by(:name => "Bathroom accessories", :category_id => @cat1b.id)
SubCategory.find_or_create_by(:name => "Mirrors", :category_id => @cat1b.id)

@cat2 = Category.find_by_name('Curtains') 
SubCategory.find_or_create_by(:name => "Window curtains", :category_id => @cat2.id)
SubCategory.find_or_create_by(:name => "Door curtains", :category_id => @cat2.id)
SubCategory.find_or_create_by(:name => "Long door curtains", :category_id => @cat2.id)
SubCategory.find_or_create_by(:name => "Curtain accessories", :category_id => @cat2.id)
SubCategory.find_or_create_by(:name => "Sheer curtains", :category_id => @cat2.id)
SubCategory.find_or_create_by(:name => "Tie backs", :category_id => @cat2.id)
SubCategory.find_or_create_by(:name => "Curtain rods", :category_id => @cat2.id)
SubCategory.find_or_create_by(:name => "Blinds", :category_id => @cat2.id)

@cat3 = Category.find_by_name('Furniture') 
SubCategory.find_or_create_by(:name => "Living room", :category_id => @cat3.id)
SubCategory.find_or_create_by(:name => "Dining room", :category_id => @cat3.id)
SubCategory.find_or_create_by(:name => "Bedroom", :category_id => @cat3.id)
SubCategory.find_or_create_by(:name => "Bar and study", :category_id => @cat3.id)
SubCategory.find_or_create_by(:name => "Outdoor", :category_id => @cat3.id)
SubCategory.find_or_create_by(:name => "Luxury", :category_id => @cat3.id)
SubCategory.find_or_create_by(:name => "Doors", :category_id => @cat3.id)
SubCategory.find_or_create_by(:name => "Shoe racks", :category_id => @cat3.id)

@cat4 = Category.find_by_name('Cushions') 
SubCategory.find_or_create_by(:name => "Cushion covers ", :category_id => @cat4.id)
SubCategory.find_or_create_by(:name => "Cushion inserts", :category_id => @cat4.id)
SubCategory.find_or_create_by(:name => "Filled cushions", :category_id => @cat4.id)
SubCategory.find_or_create_by(:name => "Throw", :category_id => @cat3.id)

@cat5 = Category.find_by_name('Decor') 
SubCategory.find_or_create_by(:name => "Candles and fragrances", :category_id => @cat5.id)
SubCategory.find_or_create_by(:name => "Candlesticks and Lamps", :category_id => @cat5.id)
SubCategory.find_or_create_by(:name => "Vases and flowers", :category_id => @cat5.id)
SubCategory.find_or_create_by(:name => "Wall decor", :category_id => @cat5.id)
SubCategory.find_or_create_by(:name => "Rugs and carpets", :category_id => @cat5.id)
SubCategory.find_or_create_by(:name => "Home accents", :category_id => @cat5.id)
SubCategory.find_or_create_by(:name => "Handicraft", :category_id => @cat5.id)
SubCategory.find_or_create_by(:name => "Photo frames and albums", :category_id => @cat5.id)

@cat6 = Category.find_by_name('Kids') 
SubCategory.find_or_create_by(:name => "Educational", :category_id => @cat6.id)
SubCategory.find_or_create_by(:name => "Party", :category_id => @cat6.id)
SubCategory.find_or_create_by(:name => "Bedroom", :category_id => @cat6.id)
SubCategory.find_or_create_by(:name => "Playroom", :category_id => @cat6.id)
SubCategory.find_or_create_by(:name => "Soft toys and cushions", :category_id => @cat6.id)
SubCategory.find_or_create_by(:name => "Toys", :category_id => @cat6.id)



