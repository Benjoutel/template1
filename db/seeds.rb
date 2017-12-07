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
    address: "Caregiver note without real address",
    phone_number: "Caregiver note without real phone_number",
    mail: "Caregiver note without real mail",
    speciality: "Caregiver note without real speciality",
    patient: benjamin
  },
  {
    firstname: "Marc",
    lastname: "Greene",
    address: "46 Bis Boulevard Gabriel Guist'Hau, 44000 Nantes ",
    phone_number: "02 40 20 32 41",
    mail: "marc.greene@gmail.com",
    speciality: "Medecin généraliste, Docteur du Sport",
    photo: File.open(Rails.root.join('db/fixtures/images/doctor.png')),
    patient: benjamin
  },
  {
    firstname: "Peter",
    lastname: "Benton",
    address: "3 Place Emile Sarradin, 44300 Nantes",
    phone_number: "02 40 20 03 52",
    mail: "peter.benton@gmail.com",
    speciality: "Radiologue",
    photo: File.open(Rails.root.join('db/fixtures/images/radiologist.png')),
    patient: benjamin
  },
  {
    firstname: "John",
    lastname: "Carter",
    address: " 8 Rue Marie Anne du Boccage, 44000 Nantes",
    phone_number: "02 40 69 13 13",
    mail: "john.carter@gmail.com",
    speciality: "Kiné",
    photo: File.open(Rails.root.join('db/fixtures/images/kine.png')),
    patient: benjamin
  }
]

Caregiver.create!(caregiver_attributes)
puts "Finished!"

event_attributes = [
  {
    category: "note",
    description: "Création de l'épisode",
    episode: Episode.first,
    date: "2017-01-01",
    caregiver: Caregiver.first
  },
  {
    category: "note",
    description: "J'ai mal au pied. J'ai beau ête matinale, j'ai mal",
    episode: Episode.first,
    date: "2017-01-02",
    caregiver: Caregiver.first
  },
  {
    category: "appointment",
    description: "Le docteur m'a donné une ordonnnance pour faire une radio",
    episode: Episode.first,
    date: "2017-01-11",
    caregiver: Caregiver.all[1]
  },
  {
    category: "appointment",
    description: " Il a remarqué une epine calcanéenne sous mon pied gauche. A confirmer avec le docteur Greene",
    episode: Episode.first,
    date: "2017-02-01",
    caregiver: Caregiver.all[2]
  },
  {
    category: "appointment",
    description: "Le docteur Greene confirme l'épine calcanéenne",
    episode: Episode.first,
    date: "2017-02-21",
    caregiver: Caregiver.all[1]
  },
  {
    category: "appointment",
    description: "Premier exercice effectué avec le docteur Carter",
    episode: Episode.first,
    date: "2017-03-04",
    caregiver: Caregiver.all[3]
  },
  {
    category: "note",
    description: "Je commence à aller mieux",
    episode: Episode.first,
    date: "2017-05-02",
    caregiver: Caregiver.first
  },
  {
    category: "note",
    description: "Création de l'épisode",
    episode: Episode.all[1],
    date: "2016-01-01",
    caregiver: Caregiver.first
  },
    {
    category: "note",
    description: "Création de l'épisode",
    episode: Episode.all[2],
    date: "2015-01-01",
    caregiver: Caregiver.first
  }
]

event = Event.create!(event_attributes)


document_attributes = [
  {
    category: "ordonnnance",
    name: "ordonnnance du Dr",
    event: Event.all[1],
    document: File.open(Rails.root.join('db/fixtures/images/ordonnance.jpg'))
  },
    {
    category: "radio",
    name: "Radio 1",
    event: Event.all[2],
    document: File.open(Rails.root.join('db/fixtures/images/radio1.jpg'))
  },
    {
    category: "radio",
    name: "Radio 2",
    event: Event.all[2],
    document: File.open(Rails.root.join('db/fixtures/images/radio2.jpg'))
  },
    {
    category: "radio",
    name: "Radio 3",
    event: Event.all[2],
    document: File.open(Rails.root.join('db/fixtures/images/radio3.jpg'))
  }
]


Document.create!(document_attributes)
