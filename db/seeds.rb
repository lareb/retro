# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Seed Klass data
puts "Pushing Classes"
ActiveRecord::Base.connection.execute("TRUNCATE TABLE klasses")
klasses = [{ :name => '1', :display_name => "1st", :max_studen_count => 60},{ :name => '2', :display_name => "2nd", :max_studen_count => 60},{ :name => '3', :display_name => "3rd", :max_studen_count => 60},{ :name => '4', :display_name => "4th", :max_studen_count => 60},
               { :name => '5', :display_name => "5th", :max_studen_count => 60},{ :name => '6', :display_name => "6th", :max_studen_count => 60},{ :name => '7', :display_name => "7th", :max_studen_count => 60},{ :name => '8', :display_name => "8th", :max_studen_count => 60}]
Klass.create!(klasses)

puts "Pushing Shifts"
ActiveRecord::Base.connection.execute("TRUNCATE TABLE shifts")
Shift.create([:name => "Morning Shift", :display_name => "Morning Shift", :start_time => "07:00:00", :end_time => "12:00:00"])

ActiveRecord::Base.connection.execute("TRUNCATE TABLE klass_shifts")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE sections")
Klass.all.each do |klass|
  KlassShift.create(:klass_id => klass.id, :shift_id => Shift.first)
  Section.create([{:name => "A", :display_name => "A", :max_studen_count => 30, :klass_id => klass.id}, {:name => "B", :display_name => "B", :max_studen_count => 30, :klass_id => klass.id}])
end

ActiveRecord::Base.connection.execute("TRUNCATE TABLE higher_qualifications")
higher_degree = HigherQualification.create([{:name =>"MBA"}, {:name =>"MCA"}, {:name =>"PhD"}, {:name =>"M.Sc"}, {:name =>"BCA"}, {:name =>"M. Phill"}])
higher_degree = higher_degree.map(&:id)


#Seed Roles data
ActiveRecord::Base.connection.execute("TRUNCATE TABLE roles")
roles = [{:name => "admin", :display_name => "Admin"}, {:name => "teacher", :display_name => "Teacher"},{:name => "guardian", :display_name => "Guardian"},{:name => "principal", :display_name => "principal"}]
ActiveRecord::Base.connection.execute("TRUNCATE TABLE roles")
Role.create(roles)

#Create Admin User
ActiveRecord::Base.connection.execute("TRUNCATE TABLE users")
admin = User.create!([:email => 'admin@pathshaala.com', :password => 'pathshaala123', :password_confirmation => 'pathshaala123'])
ActiveRecord::Base.connection.execute("TRUNCATE TABLE user_roles")
UserRole.create([:user_id => User.first.id, :role_id => Role.first.id])

#Seed Student data
male_first_name = ["lareb", "nishant","mahendra", "rakesh","anil", "sunil","irfan", "suhel", "chandan",  "swapnil", "pankaj","joy", "kaustub", "debosis", "vinod", "jethalal", "atmaram",  "tarak", "gorvindar", "malkit", "surjeet", "mikhkha", "sandeep",
  "jugle", "hari", "rasiklal","mushtaq"]

female_first_name = ["mehjabeen" ,"sweta","roprekha", "kavita", "nikita","babita", "daya", "madhvi","urmi", "somya", "amber", "raziya", "shruti", "payal"]

last_name = ["sinha", "qureshi", "nawab", "sinha", "gupta", "verma", "khan", "jadhav", "gheda", "sodhi", "mehta", "ghosh","shaikh", "malik", "ranjan", "goud",
 "tiwari", "trivedi", "majumdar", "bhide", "bais", "tiwari", "pandya", "pandye", "shrivastava"]

address_1 = ["anand nagar", "adarsh nagar", "manorama ganj", "omax township", "shalimar township", "aada bazar", "khajuri bazar", "sudama nagar", "naya bhagh", "imli bazar"]
address_2 = ["m.g road", "a. b road", "palasya", "old palasiya", "sarafa", "kanadiya road", "sindhi colony", "rnt marge", "yashvant nagar road", "m r 10", "bhavanrkuan", "navlakha",
  "patnipura", "khajrana", "shri nagar"]

male_title = ["Mr", "Dr"]
female_title = ["Mrs", "Miss", "Dr"]
school_name = ["Shishu Vihar H.S School", "St Xaviour H.S. School", "Sambhaji rao H.S. School", "St Paul H.S School", "Indore Public H.S.School", "DPS", "IPS", "Bhavan's School"]
student_first_name = []
student_father_name = []
student_mother_name = []
prng = Random.new(1234)

puts "--------- Pushing Students name\n ----------"
ActiveRecord::Base.connection.execute("TRUNCATE TABLE students")
125.times do |index|
  #student first and last name
  student_first_name = "#{male_first_name[rand(male_first_name.length)]}"
  std_last_name = "#{last_name[rand(last_name.length)]}"

  #student's father's name
  student_father_name = "#{male_first_name[rand(male_first_name.length)]} #{std_last_name}"

  #student's mother name
  student_mother_name = "#{female_first_name[rand(female_first_name.length)]} #{std_last_name}"

  puts "-----------#{student_first_name} #{std_last_name}"
  Student.create!({:first_name => student_first_name, :last_name => std_last_name, :father_name => student_father_name, :mother_name => student_mother_name,
    :address_1 => "#{prng.rand(1..100)}, #{address_1[rand(address_1.length)]}", :address_2 => "#{address_2[rand(address_2.length)]}", :city => "indore", :state => "MP", :pincode => "454001",
    :contact_no_1 => "#{prng.rand(21528950..29999999)}", :dob => Date.parse("#{prng.rand(1..28)}-#{prng.rand(1..12)}-#{prng.rand(1996..2001)}"), :gender => "male",
    :klass_id => prng.rand(1..8), :roll_no => prng.rand(1..50), :enrollment_no => "xbgdjdgks#{prng.rand(100..5000)}"})
  #--------------------------------------------------------------------------------------
  #FEMALE STUDENT
  
  student_first_name = "#{female_first_name[rand(female_first_name.length)]}"
  std_last_name = "#{last_name[rand(last_name.length)]}"

  #student's father's name
  student_father_name = "#{male_first_name[rand(male_first_name.length)]} #{std_last_name}"

  #student's mother name
  student_mother_name = "#{female_first_name[rand(female_first_name.length)]} #{std_last_name}"

  puts "-----------#{student_first_name} #{std_last_name}"
  Student.create!({:first_name => student_first_name, :last_name => std_last_name, :father_name => student_father_name, :mother_name => student_mother_name,
    :address_1 => "#{prng.rand(1..100)}, #{address_1[rand(address_1.length)]}", :address_2 => "#{address_2[rand(address_2.length)]}", :city => "indore", :state => "MP", :pincode => "454001",
    :contact_no_1 => "#{prng.rand(21528950..29999999)}", :dob => Date.parse("#{prng.rand(1..28)}-#{prng.rand(1..12)}-#{prng.rand(1996..2001)}"), :gender => "male",
    :klass_id => prng.rand(1..8), :roll_no => prng.rand(1..50), :enrollment_no => "xbgdjdgks#{prng.rand(100..5000)}"})
end


#Seed Teachers data
ActiveRecord::Base.connection.execute("TRUNCATE TABLE teachers")
puts "-------- Inserting Teachers(male) information --------------"
5.times do |index|
  Teacher.create!(:title => male_title[rand(2)], :first_name => "#{male_first_name[rand(male_first_name.length)]}", :last_name => "#{last_name[rand(last_name.length)]}",
                  :higher_qualification_id => higher_degree[rand(6)], :contact_no_1 => "#{prng.rand(21528950..29999999)}", :contact_no_1 => "#{prng.rand(21528950..29999999)}",
                  :address => "#{prng.rand(1..100)}, #{address_1[rand(address_1.length)]}")
end

puts "-------- Inserting Teachers(female) information --------------"
5.times do |index|
  Teacher.create!(:title => female_title[rand(3)], :first_name => "#{female_first_name[rand(female_first_name.length)]}", :last_name => "#{last_name[rand(last_name.length)]}",
                  :higher_qualification_id => higher_degree[rand(6)], :contact_no_1 => "#{prng.rand(21528950..29999999)}", :contact_no_1 => "#{prng.rand(21528950..29999999)}",
                  :address => "#{prng.rand(1..100)}, #{address_1[rand(address_1.length)]}")
end


puts "Subjects"
subjects = ["Hindi", "English", "Physics", "Arts", "Social Science", "Science", "Mathematics", "Sanskrit", "Drwaing", "Dancing", "Music", "Chemestry", "Comarce","History"]
ActiveRecord::Base.connection.execute("TRUNCATE TABLE subjects")
subjects.each do |subject|
  Subject.create!(:name => subject, :description => subject, :is_live => true)
end

ActiveRecord::Base.connection.execute("TRUNCATE TABLE admissions")
100.times do |index|
  #student first and last name
  student_first_name = "#{male_first_name[rand(male_first_name.length)]}"
  std_last_name = "#{last_name[rand(last_name.length)]}"

  #student's father's name
  student_father_name = "#{male_first_name[rand(male_first_name.length)]} #{std_last_name}"

  #student's mother name
  student_mother_name = "#{female_first_name[rand(female_first_name.length)]} #{std_last_name}"

  puts "Admission-----------#{student_first_name} #{std_last_name}"
  klass = prng.rand(0..7)
  Admission.create!({:admission_no => Time.now.strftime("#{CODE}-%d%m%Y#{index+1}").upcase, :admission_batch_id => klass + 1,:student_first_name => student_first_name, :student_last_name => std_last_name, :father_name => student_father_name, :mother_name => student_mother_name,
    :last_batch => klass, :last_batch_result => "pass", :last_batch_result_in_per => prng.rand(40..98), :last_institution => "#{school_name[rand(school_name.length)]}", :last_academic_year => 2012,:address_line1 => "#{prng.rand(1..100)}, #{address_1[rand(address_1.length)]}", :address_line2 => "#{address_2[rand(address_2.length)]}", :city => "indore", :state => "MP", :zip => "454001",
    :phone1 => "#{prng.rand(21528950..29999999)}", :date_of_birth => Date.parse("#{prng.rand(1..28)}-#{prng.rand(1..12)}-#{prng.rand(1996..2001)}"), :gender => "male"})
  #--------------------------------------------------------------------------------------
  #FEMALE STUDENT

  student_first_name = "#{female_first_name[rand(female_first_name.length)]}"
  std_last_name = "#{last_name[rand(last_name.length)]}"

  #student's father's name
  student_father_name = "#{male_first_name[rand(male_first_name.length)]} #{std_last_name}"

  #student's mother name
  student_mother_name = "#{female_first_name[rand(female_first_name.length)]} #{std_last_name}"

  puts "Admission-----------#{student_first_name} #{std_last_name}"
  Admission.create!({:admission_no => Time.now.strftime("#{CODE}-%d%m%Y#{index+1}").upcase, :admission_batch_id => klass + 1, :student_first_name => student_first_name, :student_last_name => std_last_name, :father_name => student_father_name, :mother_name => student_mother_name,
    :last_batch => klass, :last_batch_result => "pass", :last_batch_result_in_per => prng.rand(40..98), :last_institution => "#{school_name[rand(school_name.length)]}", :last_academic_year => 2012,:address_line1 => "#{prng.rand(1..100)}, #{address_1[rand(address_1.length)]}", :address_line2 => "#{address_2[rand(address_2.length)]}", :city => "indore", :state => "MP", :zip => "454001",
    :phone1 => "#{prng.rand(21528950..29999999)}", :date_of_birth => Date.parse("#{prng.rand(1..28)}-#{prng.rand(1..12)}-#{prng.rand(1996..2001)}"), :gender => "male"})
end