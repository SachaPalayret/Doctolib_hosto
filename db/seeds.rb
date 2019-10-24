# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# first_name
# last-name
# specialty
# zip_code

require 'faker'

Patient.destroy_all
Doctor.destroy_all
Appointment.destroy_all

100.times do |index|
        c = City.create(name: Faker::Address.city)
        s1 = Speciality.create(name: Faker::Cannabis.type)
        s2= Speciality.create(name: Faker::Cannabis.type)
        a = Doctor.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        zip_code: Faker::Address.zip_code,
        city: c
        )
        b = Patient.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name
        )
        DocSpec.create(doctor: a, specialty:s1)
        DocSpec.create(doctor: a, specialty:s2)
        Appointment.create(doctor: a, patient: b, date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 7, format: :default), city: c)
puts "#{index} docteurs et patients crées."
puts "#{index} rdv crées."
end