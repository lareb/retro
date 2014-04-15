class Section < ActiveRecord::Base
  attr_accessible :name, :display_name, :max_studen_count, :klass_id

  belongs_to :klass
end
