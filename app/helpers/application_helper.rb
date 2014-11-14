module ApplicationHelper
	def sortable(column, name = nil)
    name||= column.nameize
    css_class = (column == sort_column) ? "current &crarr; 
      #{sort_direction}" : nil
        direction = column == sort_column && sort_direction ==  "asc" ? "desc" : "asc"
link_to name, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end
end
