# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



puts "Delete all data"

puts "Delete Documents"
Document.delete_all
puts "Delete Events"
Event.delete_all
puts "Delete Episodes"
Episode.delete_all
puts "Delete Caregivers"
Caregiver.delete_all
puts "Delete Measures"
Measure.delete_all
puts "Delete Vaccinations"
Vaccination.delete_all
puts "Delete Allergies"
Allergie.delete_all
puts "Delete Antecedents"
Antecedent.delete_all
puts "Delete Patients"
Patient.delete_all

puts "Create Patient Benjamin"
benjamin = Patient.new(firstname: "Benjamin",
  lastname: "Moutel",
  email: 'benjamin@gmail.com',
  password: 123456,
  photo: File.open(Rails.root.join('db/fixtures/images/benjamin.jpg')),
  birth_date: "14/09/1984",
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
    date: "27/10/2016"
  },
  {
    patient: benjamin,
    name: "poids",
    value: 70,
    date: "27/10/2017"
  },
  {
    patient: benjamin,
    name: "taille",
    value: 170,
    date: "27/10/2017"
  },
  {
    patient: benjamin,
    name: "taille",
    value: 170,
    date: "27/10/2016"
  }
]

Measure.create!(measure_attributes)
puts 'Finished!'


vaccination_attributes = [
    {
    patient: benjamin,
    vaccin: "diphtérie",
    date: "27/10/1985"
  },
  {
    patient: benjamin,
    vaccin: "tétanos",
    date: "27/02/1986"
  },
  {
    patient: benjamin,
    vaccin: "poliomyélite",
    date: "11/03/1986"
  },
  {
    patient: benjamin,
    vaccin: "fièvre jaune",
    date: "05/09/2010"
  }

]

Vaccination.create!(vaccination_attributes)

allergie_attributes = [  {
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

# Allergie.create!(allergie_attributes)

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
    category: "consultation",
    name: "Visite",
    description: "Visite du Dr. Greene pour mon pied gauche. Il m'a donné une ordonnnance pour faire une radio",
    episode: Episode.first,
    caregiver: Caregiver.first
  },
  {
    category: "consultation",
    name: "Visite",
    description: "Visite au cabinet de radiologie du Dr. Benton. Il a remarqué une épine calducéenne sous mon pied gauche.",
    episode: Episode.first,
    caregiver: Caregiver.all[1]
  },
  {
    category: "consultation",
    name: "Visite",
    description: "Visite du Dr  Greene. Suite au au rapport de la radio. Il m'a donné une ordonnnance pour le kinés",
    episode: Episode.first,
    caregiver: Caregiver.all[0]
  },
  {
    category: "consultation",
    name: "Visite",
    description: "Visite du kiné Carter",
    episode: Episode.first,
    caregiver: Caregiver.all[2]
  }
]

event = Event.create!(event_attributes)
