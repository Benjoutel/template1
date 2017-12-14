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

Picto.destroy_all
picto_attributes = [
  {
  name: 'notepad'
  },
  {
 name: 'fievre'
  }
]

Picto.create!([picto_attributes])


puts "Create Patient Ben"
Ben = Patient.new(firstname: "Ben",
  lastname: "Taro",
  email: 'Ben@gmail.com',
  password: "popopo",
  photo: File.open(Rails.root.join('db/fixtures/images/benjamin.jpg')),
  birth_date: "1987-09-14",
  phone_number: "06-07-30-46-76",
  address: "27 Boulevard Stalingrad 44000 Nantes"
  )
Ben.save!

puts "Patient Create"

puts "Creating measures..."

measure_attributes = [
  {
    patient: Ben,
    name: "poids",
    value: 70,
    date: "2016-10-27"
  },
  {
    patient: Ben,
    name: "poids",
    value: 70,
    date: "2017-10-27"
  },
  {
    patient: Ben,
    name: "taille",
    value: 170,
    date: "2017-10-27"
  },
  {
    patient: Ben,
    name: "taille",
    value: 170,
    date: "2016-10-27"
  }
]

Measure.create!(measure_attributes)
puts 'Finished!'


vaccination_attributes = [
    {
    patient: Ben,
    vaccin: "diphtérie",
    date: "1985-10-27"
  },
  {
    patient: Ben,
    vaccin: "tétanos",
    date: "1986-02-27"
  },
  {
    patient: Ben,
    vaccin: "poliomyélite",
    date: "1986-03-13"
  },
  {
    patient: Ben,
    vaccin: "fièvre jaune",
    date: "2010-09-05"
  }

]

Vaccination.create!(vaccination_attributes)

allergy_attributes = [  {
    patient: Ben,
    name: "accarien"
  },
  {
    patient: Ben,
    name: "pollen"
  },
  {
    patient: Ben,
    name: "taille"
  },
  {
    patient: Ben,
    name: "taille"
  }

]

Allergy.create!(allergy_attributes)

antecedent_attributes = [
    {
    patient: Ben,
    description: "pollen"
  },
  {
    patient: Ben,
    description: "poils de chatte"
  }

]

Antecedent.create!(antecedent_attributes)


puts 'Creating episodes...'
episode_attributes = [
  {#0
    patient: Ben,
    name: "Rhume decembre 2016",
    icon: File.open(Rails.root.join('app/assets/images/icons/virus.png'))
  },
  {#1
    patient: Ben,
    name: "Ma santé 0-10 ans",
    icon: File.open(Rails.root.join('app/assets/images/icons/medical-records.png'))
  },
  {#2
    patient: Ben,
    name: "Ma santé 10-20 ans",
    icon: File.open(Rails.root.join('app/assets/images/icons/medical-records.png'))
  },
  {#3
    patient: Ben,
    name: "Souffle au coeur",
    description: "Souffle au coeur FONCTIONNEL. Pas de problème.",
    icon: File.open(Rails.root.join('app/assets/images/icons/heart.png'))
  },
  {#4
    patient: Ben,
    name: "Entorse genou 2016",
    icon: File.open(Rails.root.join('app/assets/images/icons/kneecap.png'))
  },
  {#5
    patient: Ben,
    name: "Rage de dents 2017",
    icon: File.open(Rails.root.join('app/assets/images/icons/molar-7.png'))
  },
  {#6
    patient: Ben,
    name: "Allergies Printemps 2016",
    icon: File.open(Rails.root.join('app/assets/images/icons/lungs.png'))
  },
  {#7
    patient: Ben,
    name: "Grippe 2016",
    icon: File.open(Rails.root.join('app/assets/images/icons/virus.png'))
  },
    {#8
    patient: Ben,
    name: "Allergies Printemps 2008",
    icon: File.open(Rails.root.join('app/assets/images/icons/lungs.png'))
  },
  {#9
    patient: Ben,
    name: "Orthodontiste",
    icon: File.open(Rails.root.join('app/assets/images/icons/braces-2.png'))
  },
  {#10
    patient: Ben,
    name: "Grippe 2007",
    icon: File.open(Rails.root.join('app/assets/images/icons/virus.png'))
  },
  {#11
    patient: Ben,
    name: "Mal de dos 2008-2010",
    icon: File.open(Rails.root.join('app/assets/images/icons/fit.png'))
  },
  {#12
    patient: Ben,
    name: "Fracture 1998",
    icon: File.open(Rails.root.join('app/assets/images/icons/arm.png'))
  },
    {#13
    patient: Ben,
    name: "Entorse cheville gauche",
    icon: File.open(Rails.root.join('app/assets/images/icons/plastered-foot-1.png'))
  },
    {#14
    patient: Ben,
    name: "Entorse cheville droite",
    icon: File.open(Rails.root.join('app/assets/images/icons/plastered-foot-1.png'))
  },
]

episodes = Episode.create!(episode_attributes)
puts 'Finished!'

puts 'Creating caregivers...'
caregiver_attributes = [
  {
    firstname: "Marc",
    lastname: "Greene",
    address: "46 Bis Boulevard Gabriel Guist'Hau, 75000 Paris ",
    phone_number: "02 40 20 32 41",
    mail: "marc.greene@gmail.com",
    speciality: "Medecin généraliste",
    photo: File.open(Rails.root.join('db/fixtures/images/greene.png')),
    patient: Ben
  },
  {
    firstname: "Peter",
    lastname: "Benton",
    address: "Barcelone",
    phone_number: "",
    mail: "peter.benton@gmail.com",
    speciality: "Radiologue",
    photo: File.open(Rails.root.join('db/fixtures/images/benton.png')),
    patient: Ben
  },
  {
    firstname: "John",
    lastname: "Carter",
    address: "Londres",
    phone_number: "02 40 69 13 13",
    mail: "john.carter@gmail.com",
    speciality: "Dentiste",
    photo: File.open(Rails.root.join('db/fixtures/images/carter.png')),
    patient: Ben
  },
  {
    firstname: "Laurent",
    lastname: "Gabai",
    address: "Berlin",
    phone_number: "02 40 69 13 13",
    mail: "john.carter@gmail.com",
    speciality: "Cardiologue",
    photo: File.open(Rails.root.join('db/fixtures/images/aime.png')),
    patient: Ben
  }
]

caregivers = Caregiver.create!(caregiver_attributes)
puts "Finished!"

puts "Creating events"
event_attributes = [
  {#0
    category: "note",
    description: "Création de l'épisode",
    episode: episodes[0],
    date: "2016-12-03 12:40:00.0"
  },
  {#1
    category: "note",
    description: "Création de l'épisode",
    episode: episodes[1],
    date: "2016-11-03 12:40:00.0"
  },
  {#2
    category: "note",
    description: "Création de l'épisode",
    episode: episodes[2],
    date: "2016-10-03 12:40:00.0"
  },
  {#3
    category: "note",
    description: "Création de l'épisode",
    episode: episodes[3],
    date: "2015-03-01 12:40:00.0"
  },
  {#4
    category: "note",
    description: "Création de l'épisode",
    episode: episodes[4],
    date: "2016-09-03 12:40:00.0"
  },
  {#5
    category: "note",
    description: "Création de l'épisode",
    episode: episodes[5],
    date: "2017-08-01 12:40:00.0"
  },
  {#6
    category: "note",
    description: "Création de l'épisode",
    episode: episodes[6],
    date: "2016-08-03 12:40:00.0"
  },
  {#7
    category: "note",
    description: "Création de l'épisode",
    episode: episodes[7],
    date: "2016-07-03 12:40:00.0"
  },
  {#8
    category: "note",
    description: "Création de l'épisode",
    episode: episodes[8],
    date: "2016-06-03 12:40:00.0"
  },
  {#9
    category: "note",
    description: "Création de l'épisode",
    episode: episodes[9],
    date: "2016-05-03 12:40:00.0"
  },
  {#10
    category: "note",
    description: "Création de l'épisode",
    episode: episodes[10],
    date: "2016-04-03 12:40:00.0"
  },
  {#11
    category: "note",
    description: "Création de l'épisode",
    episode: episodes[11],
    date: "2016-03-03 12:40:00.0"
  },
  {#12
    category: "note",
    description: "Création de l'épisode",
    episode: episodes[12],
    date: "2016-02-03 12:40:00.0"
  },
    {#13
    category: "note",
    description: "Création de l'épisode",
    episode: episodes[13],
    date: "2016-01-03 12:40:00.0"
  },
    {#14
    category: "note",
    description: "Création de l'épisode",
    episode: episodes[14],
    date: "2015-12-03 12:40:00.0"
  },
  ############
  #episode id 5 : rage de dent
  {#15
    category: "note",
    description: "Ca va beaucoup mieux. Ouf. J'ai cru mourrir. J'ai douillé!",
    episode: episodes[5],
    date: "2017-09-07"
  },
  {#16
    category: "appointment",
    description: "Abcès. Traitement de l'abcès. Soulagement dès qu'il a percé l'abcès. Amoxicilline et paracétamol/codeine. J'aurais dû venir plus tôt d'après le dentiste...",
    episode: episodes[5],
    date: "2017-09-01",
    caregiver: caregivers[2], #dentiste
    icon: File.open(Rails.root.join('app/assets/images/icons/canine.png'))
  },
  {#17
    category: "note",
    description: "Trop mal à la dent!!! J'ai un rdv cet apremidi chez le dentiste. Petite photo-souvenir :(((",
    episode: episodes[5],
    date: "2017-09-01",
    icon: File.open(Rails.root.join('app/assets/images/icons/virus.png'))
  },
  {#18
    category: "note",
    description: "Train de fièvre et douleur à la tête",
    episode: episodes[5],
    date: "2017-08-25",
    icon: File.open(Rails.root.join('app/assets/images/icons/virus.png'))
  },
  ##########episode id 3 : souffle au coeur
  {#19
    category: "appointment",
    description: "Visite de routine chez le doc. Je suis assez fatigué en ce moment. Soit c'est la sortie de l'hiver, soit c'est le taff ou peut-etre autre chose. Le dr aimerait que je fasse des examens du coeur car il dit que j'ai un souffle au coeur. Je l'ai depuis longtemps mais il dit qu'il vaut mieux vérifier le coeur tant que je vais bien :). ",
    episode: episodes[3],
    date: "2015-03-01",
    caregiver: caregivers[0], #medecin generaliste
    icon: File.open(Rails.root.join('app/assets/images/icons/stethoscope.png'))
  },
  {#20
    category: "appointment",
    description: "ECG et echographie cardiaque chez le cardiologue. J'avais jamais vu mon coeur!",
    episode: episodes[3],
    date: "2015-03-10",
    caregiver: caregivers[3], #cardiologue,
    icon: File.open(Rails.root.join('app/assets/images/icons/cardiogram.png'))
  },
  {#21
    category: "appointment",
    description: "Radio pour compléter le bilan cardiaque. Pas très bavard le radiologue. J'avais l'impression de le déranger ;)",
    episode: episodes[3],
    date: "2015-03-18",
    caregiver: caregivers[1], #radiologue,
    icon: File.open(Rails.root.join('app/assets/images/icons/x-ray.png'))
  },
  {#22
    category: "appointment",
    description: "Conclusion du cardiologue: \"Pas de problème cardiaque. C'est un souffle fonctionnel.\" Ca veut dire que je vais bien, que je fais partie des gens dont le coeur fait des bruits chelous.",
    episode: episodes[3],
    date: "2015-03-20",
    caregiver: caregivers[3], #cardiologue
    icon: File.open(Rails.root.join('app/assets/images/icons/cardiogram.png'))
  },
  {#23
    category: "appointment",
    description: "Je viens montrer les resultats de mes examens du coeur. Tout est cool. ",
    episode: episodes[3],
    date: "2015-03-30",
    caregiver: caregivers[0], #medecin generaliste
    icon: File.open(Rails.root.join('app/assets/images/icons/stethoscope.png'))
  }

]

events = Event.create!(event_attributes)


document_attributes = [
  {
    category: "medicament",
    name: "Ma vieille boite d'efferalgan",
    event: events[18],
    document: File.open(Rails.root.join('db/fixtures/images/efferalgan.jpg'))
  },
    {
    category: "photo",
    name: "oh ma bouche",
    event: events[17],
    document: File.open(Rails.root.join('db/fixtures/images/abces-dent.jpg'))
  },
    {
    category: "ordonnance",
    name: "ordo dentiste",
    event: events[16],
    document: File.open(Rails.root.join('db/fixtures/images/ordo-dentiste.jpg'))
  },
    {##########
    category: "radio",
    name: "Radio coeur",
    event: events[21],
    document: File.open(Rails.root.join('db/fixtures/images/radio-coeur.jpg'))
  },
  {
    category: "ECG",
    name: "ECG de mon coeur",
    event: events[20],
    document: File.open(Rails.root.join('db/fixtures/images/ecg.png'))
  },
  {
    category: "echographie",
    name: "Echo de mon coeur",
    event: events[20],
    document: File.open(Rails.root.join('db/fixtures/images/echo-coeur.jpg'))
  },
  {
    category: "ordonnance",
    name: "ordo controle coeur",
    event: events[22],
    document: File.open(Rails.root.join('db/fixtures/images/ordo-controle-coeur.jpg'))
  }

]


documents = Document.create!(document_attributes)







