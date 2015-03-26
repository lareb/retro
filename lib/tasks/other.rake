namespace :feedback do
  desc 'Update old feedback relationship'
  task :update => :environment do
    begin
      
      Klass.all.each do |k|
        k.students.each_with_index do |s, index|
          if(index%2 == 0)
            s.update_attributes(:section_id => k.sections.map(&:id)[0])
          else
            s.update_attributes(:section_id => k.sections.map(&:id)[1])
          end
        end
      end
      puts "----Relationship has been updated-----"
    rescue Exception => e
      puts e.message
    end
  end
end
