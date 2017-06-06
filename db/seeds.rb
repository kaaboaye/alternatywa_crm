# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

School.create([
    {name: "Brak"},
    {name: "1 gim"},
    {name: "2 gim"},
    {name: "1 lo"},
    {name: "2 lo"}
  ])

def school
  School.order("RANDOM()").first.id
end

Member.create([
    {first_name: "Mariusz", last_name: "Wysocki", pesel: 66010242494, city: "Mysłowice", school_id: school(), phone: 679980116},
    {first_name: "Iwo", last_name: "Michalski", pesel: 67031192414, city: "Katowice", school_id: school(), phone: 799308747},
    {first_name: "Gracja", last_name: "Piotrowska", pesel: 64062299884, city: "Warszawa", school_id: school(), phone: 603908085},
    {first_name: "Świętomierz", last_name: "Olszewski", pesel: 73031899978, city: "Poznań", school_id: school(), phone: 797244283},
    {first_name: "Agnieszka", last_name: "Kucharska", pesel: 83011672268, city: "Warszawa", school_id: school(), phone: 694633986},
    {first_name: "Ludwika", last_name: "Kamińska", pesel: 88092333008, city: "Gdynia", school_id: school(), phone: 515310640}
  ])

Group.create([
    {name: "Bieganie"},
    {name: "Konie"},
    {name: "Rowery"},
    {name: "Cokolwiek"}
  ])

EventCategory.create([
    {name: "Wyjazd"},
    {name: "Grupowe"},
    {name: "Integracyjne"},
    {name: "Sportowe"}
  ])

def ev_cat
  EventCategory.order("RANDOM()").first.id
end

def d
  rand(2.years).seconds.ago
end

Event.create([
    {name: "Pajacowanie", datetime: d(), event_category_id: ev_cat()},
    {name: "Niepoodkrajanie", datetime: d(), event_category_id: ev_cat()},
    {name: "Bonapartów", datetime: d(), event_category_id: ev_cat()},
    {name: "Rozleniwiać", datetime: d(), event_category_id: ev_cat()},
    {name: "Zmydlać", datetime: d(), event_category_id: ev_cat()}
  ])
