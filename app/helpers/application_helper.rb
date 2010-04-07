# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	#Return a title on a per-page basis.					# Documentation comment
	def title												# Method definition
		base_title = "Ruby on Rails Tutorial Sample App"	# Variable assignment
		if @title.nil?										# Boolean test for nil
			base_title										# Implicit return
		else
			"#{base_title} | #{h(@title)}"						# String interpolation
		end
	end
	
	#Return a logo
	def logo
		base_logo = image_tag("logo.png", :alt => "Sample App", :class => "round")
		if @logo.nil?
			base_logo
		else
			"Sample App"
		end
	end
end
