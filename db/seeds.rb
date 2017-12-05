# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



puts "destroy all data"

puts "destroy Documents"
Document.destroy_all
puts "destroy Events"
Event.destroy_all
puts "destroy Episodes"
Episode.destroy_all
puts "destroy Caregivers"
Caregiver.destroy_all
puts "destroy Measures"
Measure.destroy_all
puts "destroy Vaccinations"
Vaccination.destroy_all
puts "destroy Allergies"
Allergy.destroy_all
puts "destroy Antecedents"
Antecedent.destroy_all
puts "destroy Patients"
Patient.destroy_all

puts "Create Patient Benjamin"
benjamin = Patient.new(firstname: "Benjamin",
  lastname: "Moutel",
  email: 'benjamin@gmail.com',
  password: 123456,
  photo: File.open(Rails.root.join('db/fixtures/images/benjamin.jpg')),
  birth_date: "1984-09-14",
  phone_number: "06-07-30-46-76",
  address: "27 Boulevard Stalingrad 44000 Nantes"
  )
benjamin.save!

puts "Patient Create"

puts "Creating measures..."

measure_attributes = [
  {
    patient: benjamin,
    name: "poids",
    value: 70,
    date: "2016-10-27"
  },
  {
    patient: benjamin,
    name: "poids",
    value: 70,
    date: "2017-10-27"
  },
  {
    patient: benjamin,
    name: "taille",
    value: 170,
    date: "2017-10-27"
  },
  {
    patient: benjamin,
    name: "taille",
    value: 170,
    date: "2016-10-27"
  }
]

Measure.create!(measure_attributes)
puts 'Finished!'


vaccination_attributes = [
    {
    patient: benjamin,
    vaccin: "diphtérie",
    date: "1985-10-27"
  },
  {
    patient: benjamin,
    vaccin: "tétanos",
    date: "1986-02-27"
  },
  {
    patient: benjamin,
    vaccin: "poliomyélite",
    date: "1986-03-13"
  },
  {
    patient: benjamin,
    vaccin: "fièvre jaune",
    date: "2010-09-05"
  }

]

Vaccination.create!(vaccination_attributes)

allergy_attributes = [  {
    patient: benjamin,
    name: "accarien"
  },
  {
    patient: benjamin,
    name: "pollen"
  },
  {
    patient: benjamin,
    name: "taille"
  },
  {
    patient: benjamin,
    name: "taille"
  }

]

Allergy.create!(allergy_attributes)

# antecedent_attributes = [
#     {
#     patient: benjamin,
#     description: "27/10/2016"
#   },
#   {
#     patient: benjamin,
#     description: ""
#   },
#   {
#     patient: benjamin,
#     description: "27/10/2017"
#   },
#   {
#     patient: benjamin,
#     description: "27/10/2016"
#   }

# ]

# Antecedent.create!(antecedent_attributes)




puts 'Creating episodes...'
episode_attributes = [
  {
    patient: benjamin,
    name: "Douleur en dessous du pied"
  },
  {
    patient: benjamin,
    name: "Asthme"
  },
  {
    patient: benjamin,
    name: "Urticaire"
  }
]

Episode.create!(episode_attributes)
puts 'Finished!'

puts 'Creating caregivers...'
caregiver_attributes = [
    {
    firstname: "Note",
    lastname: "Note",
    address: "46 Bis Boulevard Gabriel Guist'Hau, 44000 Nantes ",
    phone_number: "02 40 20 32 41",
    mail: "marc.greene@gmail.com",
    speciality: "Medecin généraliste, Docteur du Sport",
    patient: benjamin
  },
  {
    firstname: "Marc",
    lastname: "Greene",
    address: "46 Bis Boulevard Gabriel Guist'Hau, 44000 Nantes ",
    phone_number: "02 40 20 32 41",
    mail: "marc.greene@gmail.com",
    speciality: "Medecin généraliste, Docteur du Sport",
    patient: benjamin
  },
  {
    firstname: "Peter",
    lastname: "Benton",
    address: "3 Place Emile Sarradin, 44300 Nantes",
    phone_number: "02 40 20 03 52",
    mail: "peter.benton@gmail.com",
    speciality: "Radiologue",
    patient: benjamin
  },
  {
    firstname: "John",
    lastname: "Carter",
    address: " 8 Rue Marie Anne du Boccage, 44000 Nantes",
    phone_number: "02 40 69 13 13",
    mail: "john.carter@gmail.com",
    speciality: "Kiné",
    patient: benjamin
  },
]

Caregiver.create!(caregiver_attributes)
puts "Finished!"

event_attributes = [
  {
    category: "note",
    name: "Visite",
    description: "Création de l'épisode",
    episode: Episode.first,
    date: "2017-01-01",
    caregiver: Caregiver.first
  },
  {
    category: "note",
    name: "Visite",
    description: "J'ai mal au pied. J'ai beau ête matinale, j'ai mal",
    episode: Episode.first,
    date: "2017-01-02",
    caregiver: Caregiver.first
  },
  {
    category: "consultation",
    name: "Visite",
    description: "Visite du Dr. Greene pour mon pied gauche. Il m'a donné une ordonnnance pour faire une radio",
    episode: Episode.first,
    date: "2017-01-11",
    caregiver: Caregiver.all[1]
  },
  {
    category: "consultation",
    name: "Visite",
    description: "Visite au cabinet de radiologie du Dr. Benton. Il a remarqué une épine calducéenne sous mon pied gauche.",
    episode: Episode.first,
    date: "2017-02-01",
    caregiver: Caregiver.all[2]
  },
  {
    category: "consultation",
    name: "Visite",
    description: "Visite du Dr  Greene. Suite au au rapport de la radio. Il m'a donné une ordonnnance pour le kinés",
    episode: Episode.first,
    date: "2017-02-21",
    caregiver: Caregiver.all[1]
  },
  {
    category: "consultation",
    name: "Visite",
    description: "Visite du kiné Carter",
    episode: Episode.first,
    date: "2017-03-04",
    caregiver: Caregiver.all[3]
  },
  {
    category: "note",
    name: "Visite",
    description: "Je commence à aller mieux",
    episode: Episode.first,
    date: "2017-05-02",
    caregiver: Caregiver.first
  },
  {
    category: "note",
    name: "Visite",
    description: "Création de l'épisode",
    episode: Episode.all[1],
    date: "2016-01-01",
    caregiver: Caregiver.first
  },
    {
    category: "note",
    name: "Visite",
    description: "Création de l'épisode",
    episode: Episode.all[2],
    date: "2015-01-01",
    caregiver: Caregiver.first
  },
]

event = Event.create!(event_attributes)


document_attributes = [
  {
    category: "ordonnnance",
    name: "ordonnnance du Dr",
    event: Event.all[1],,
    document: File.open(Rails.root.join('db/fixtures/images/ordonnance.jpg'))
  },
    {
    category: "radio",
    name: "ordonnnance du Dr",
    event: Event.all[2],
    document: File.open(Rails.root.join('db/fixtures/images/radio1.jpg'))
  },
    {
    category: "radio",
    name: "ordonnnance du Dr",
    event: Event.all[2],
    document: File.open(Rails.root.join('db/fixtures/images/radio2.jpg'))
  },
    {
    category: "radio",
    name: "ordonnnance du Dr",
    event: Event.all[2],
    document: File.open(Rails.root.join('db/fixtures/images/radio3.jpg'))
  },
]


Document.create!(document_attributes)
