require 'date'
def spelling(month)
  month_array = [ 
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ]
  month_array.include?(month)
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  student = []
  name = gets.chomp.capitalize
  while !name.empty? do
    puts "Please enter the student's country of birth"
    country = gets.chomp.capitalize
    puts "Please enter the student's hobbies"
    hobbies = gets.chomp
    puts "Please enter the student's height in metres and centimetres"
    height = gets.chomp
    puts "What cohort month are they in?"
    month = gets.chomp.capitalize
    if month.empty?
      month = "November"
    else
      until spelling(month) == true
        puts "Please check the spelling of the month and try again"
        month = gets.chomp.capitalize
      end
    end
    student << {name: name, country: country, hobbies: hobbies, height: height, cohort: month.to_sym}
    puts "Now we have #{student.count} students"
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = gets.chomp.capitalize
  end
  student
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
    students.each.with_index(1) do |student,index|
      puts "#{index} #{student[:name].center(16)} #{student[:country].center(15)} #{student[:hobbies].center(15)} #{student[:height].center(15)} (#{student[:cohort]} cohort)"
  end
end
# The same method using loops
def print_loop(students)
  until students.empty?
    name = students.pop
    puts "#{name[:name]} #{name[:country]} #{name[:hobbies]}
    #{name[:height]}#{name[:cohort]} cohort"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
def letter_sort(students)
  students.each do |student|
    if student[:name].start_with?("N")
      puts student
    end
  end
end
def name_length(students)
  students.each do |student|
    if student[:name].length < 12
      puts student
    end
  end
end

def group_by_cohort(students)
  cohorts_hash = {}
  puts "Cohort Groups"
  students.each do |student|
    cohort = student[:cohort]
    name = student[:name]
    if cohorts_hash[cohort] == nil
      cohorts_hash[cohort] = [name]
    else
      cohorts_hash[cohort].push(name)
    end
  end
  cohorts_hash.each do |key, value|
    puts "Cohort #{key}"
    puts value
  end
end

students = input_students
if students.empty?
  puts "No students found"
end
print_header
print(students)
puts ""
puts "names under 12 characters"
name_length(students)
puts ""
puts "names starting with N"
letter_sort(students)
puts ""
group_by_cohort(students)
print_footer(students)