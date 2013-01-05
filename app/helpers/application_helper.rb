module ApplicationHelper
	def check(boolean, options={})
		options[:true]		 ||=''
		options[:true_class] ||='check'
		options[:false]		 ||=''
		options[:false_class]||=''

		if boolean
			content_tag(:span, options[:true], :class => options[:true_class])
		else
			content_tag(:span, options[:false], :class => options[:false_class])			
		end
	end

  def get_roles(user)
    roles = []
    user.roles.each do |r|
      roles.push(r.display_name)
    end
    return roles.join(", ")
  end
end
