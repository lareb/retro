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

  def display_label(title, value)
    return if value.blank?
    <<-eos
      <div class="input">
          <label class="display_label">#{title}</label>
          <label class="display_value">#{value}</label>
      </div>
    eos
  end

  def teacher_name(teacher)
    return teacher.gender.try(:downcase) == "female" ? "<i class='fa fa-female'></i> #{teacher.name}" : "<i class='fa fa-male'></i> #{teacher.name}"
  end
  
  
end
