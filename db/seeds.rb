# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def school
  School.order("RANDOM()").first
end

def ev_cat
  EventCategory.order("RANDOM()").first
end

def d
  rand(2.years).seconds.ago
end

def member
  Member.order("RANDOM()").first
end

def ls
  LessonSubject.order("RANDOM()").first
end

School.create([
    {name: "Brak"},
    {name: "1 gim"},
    {name: "2 gim"},
    {name: "1 lo"},
    {name: "2 lo"}
  ])

Member.create([
    {first_name: "Mariusz", last_name: "Wysocki", pesel: 66010242494, city: "Mysłowice", school: school(), phone: 679980116},
    {first_name: "Iwo", last_name: "Michalski", pesel: 67031192414, city: "Katowice", school: school(), phone: 799308747},
    {first_name: "Gracja", last_name: "Piotrowska", pesel: 64062299884, city: "Warszawa", school: school(), phone: 603908085},
    {first_name: "Świętomierz", last_name: "Olszewski", pesel: 73031899978, city: "Poznań", school: school(), phone: 797244283},
    {first_name: "Agnieszka", last_name: "Kucharska", pesel: 83011672268, city: "Warszawa", school: school(), phone: 694633986},
    {first_name: "Sergiusz", last_name: "Adamczyk", pesel: 72072951353, city: "Łódź", school: school(), phone: 511342552},
    {first_name: "Marcelina", last_name: "Kaczmarek", pesel: 63063034360, city: "Gdańsk", school: school(), phone: 792215084},
    {first_name: "Wera", last_name: "Tomaszewska", pesel: 42122594306, city: "Szczecin", school: school(), phone: 601817834},
    {first_name: "Kornelia", last_name: "Pawlak", pesel: 62030682283, city: "Poznań", school: school(), phone: 666161390},
    {first_name: "Izabella", last_name: "Jaworska", pesel: 73022110103, city: "Jastrzębie-Zdrój", school: school(), phone: 787554584},
    {first_name: "Radosław", last_name: "Czarnecki", pesel: 33120894536, city: "Kraków", school: school(), phone: 692541465},
    {first_name: "Ludwika", last_name: "Kamińska", pesel: 88092333008, city: "Gdynia", school: school(), phone: 515310640}
  ])

Group.create([
    {name: "Bieganie"},
    {name: "Konie"},
    {name: "Rowery"},
    {name: "Narty"},
    {name: "Tańce"},
    {name: "Cokolwiek"}
  ])

EventCategory.create([
    {name: "Wyjazd"},
    {name: "Grupowe"},
    {name: "Integracyjne"},
    {name: "Sportowe"}
  ])

Event.create([
    {name: "Pajacowanie", datetime: d(), event_category: ev_cat()},
    {name: "Niepoodkrajanie", datetime: d(), event_category: ev_cat()},
    {name: "Bonapartów", datetime: d(), event_category: ev_cat()},
    {name: "Rozleniwiać", datetime: d(), event_category: ev_cat()},
    {name: "Skakanie", datetime: d(), event_category: ev_cat()},
    {name: "Nowy rok", datetime: d(), event_category: ev_cat()},
    {name: "Zmydlać", datetime: d(), event_category: ev_cat()}
  ])

LessonSubject.create([
    {name: "Polski"},
    {name: "Matematyka"},
    {name: "Fizyka"},
    {name: "Historia"},
    {name: "Muzyka"},
    {name: "IT"},
    {name: "Geografia"}
  ])

for x in 0..50
  Lesson.create giving_member: member(),
    taking_member: member(),
    lesson_subject: ls(),
    time: d(),
    datetime: d()
end
