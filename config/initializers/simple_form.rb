#SimpleForm.setup do |config|  
#  config.wrappers :inline_checkbox, :tag => 'div', :class => 'form-group', :error_class => 'error' do |b|
#    b.use :html5
#    b.use :placeholder
#    b.wrapper :tag => 'div', :class => 'checkbox' do |ba|
#      ba.wrapper :tag => 'label' do |bb|
#        bb.use :input
#        bb.use :label_text
#      end
#    end
#  end
#end



#config.wrappers :inline_checkbox, :tag => 'div', :class => 'control-group', :error_class => 'error' do |b|
#  b.use :html5
#  b.use :placeholder
#  b.wrapper :tag => 'div', :class => 'controls' do |ba|
#    ba.wrapper :tag => 'label', :class => 'checkbox' do |bb|
#      bb.use :input
#      bb.use :label_text
#    end
#    ba.use :error, :wrap_with => { :tag => 'span', :class => 'help-inline' }
#    ba.use :hint,  :wrap_with => { :tag => 'p', :class => 'help-block' }
#  end
#end