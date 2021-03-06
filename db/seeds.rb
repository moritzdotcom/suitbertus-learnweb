# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

8.times do |i|
  Grade.create(grade: i+5)
  puts "Create Grade #{i+5}"
end

Grade.all.each do |grade|
  subject = Subject.new(name: 'Mathematik', icon: 'fas fa-calculator')
  subject.grade = grade
  subject.save

  subject = Subject.new(name: 'Deutsch', icon: 'fas fa-book')
  subject.grade = grade
  subject.save

  subject = Subject.new(name: 'Englisch', icon: 'fas fa-flag-usa')
  subject.grade = grade
  subject.save
end

