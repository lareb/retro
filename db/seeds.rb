# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.connection.execute("TRUNCATE TABLE klasses")
Klass.create!([{ :name => '1', :display_name => "1st"},{ :name => '2', :display_name => "2nd"},{ :name => '3', :display_name => "3rd"},{ :name => '4', :display_name => "4th"},
               { :name => '5', :display_name => "5th"},{ :name => '6', :display_name => "6th"},{ :name => '7', :display_name => "7th"},{ :name => '8', :display_name => "8th"}])

male_first_name = ["lareb", "nishant","mahendra", "rakesh","anil", "sunil","irfan", "suhel", "chandan",  "swapnil", "pankaj","joy", "kaustub", "debosis", "vinod", "jethalal", "atmaram",  "tarak", "gorvindar", "malkit", "surjeet", "kikhkha", "sandeep",
  "jugle", "hari", "rasiklal","mushtaq"]

female_first_name = ["mehjabeen" ,"sweta","roprekha", "kavita", "nikita","babita", "daya", "madhvi","urmi", "somya", "amber", "raziya", "shruti", "payal"]

last_name = ["sinha", "qureshi", "nawab", "sinha", "gupta", "verma", "khan", "jadhav", "gheda", "sodhi", "mehta", "ghosh","shaikh", "malik", "ranjan", "goud",
 "tiwari", "trivedi", "majumdar", "bhide", "bais", "tiwari", "pandya", "pandye", "shrivastava"]

address_1 = ["anand nagar", "adarsh nagar", "manorama ganj", "omax township", "shalimar township", "aada bazar", "khajuri bazar", "sudama nagar", "naya bhagh", "imli bazar"]
address_2 = ["m.g road", "a. b road", "palasya", "old palasiya", "sarafa", "kanadiya road", "sindhi colony", "rnt marge", "yashvant nagar road", "m r 10", "bhavanrkuan", "navlakha",
  "patnipura", "khajrana", "shri nagar"]



student_first_name = []
student_last__name = []
student_father_name = []
student_mother_name = []
prng = Random.new(1234)

puts "---------pushing Male students name\n"
ActiveRecord::Base.connection.execute("TRUNCATE TABLE students")
100.times do |index|
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