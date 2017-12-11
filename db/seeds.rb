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

puts "Create Patient chris"
chris = Patient.new(firstname: "christophe",
  lastname: "Taro",
  email: 'chris@gmail.com',
  password: "popopo",
  photo: File.open(Rails.root.join('db/fixtures/images/benjamin.jpg')),
  birth_date: "1987-09-14",
  phone_number: "06-07-30-46-76",
  address: "27 Boulevard Stalingrad 44000 Nantes"
  )
chris.save!

puts "Patient Create"

puts "Creating measures..."

measure_attributes = [
  {
    patient: chris,
    name: "poids",
    value: 70,
    date: "2016-10-27"
  },
  {
    patient: chris,
    name: "poids",
    value: 70,
    date: "2017-10-27"
  },
  {
    patient: chris,
    name: "taille",
    value: 170,
    date: "2017-10-27"
  },
  {
    patient: chris,
    name: "taille",
    value: 170,
    date: "2016-10-27"
  }
]

Measure.create!(measure_attributes)
puts 'Finished!'


vaccination_attributes = [
    {
    patient: chris,
    vaccin: "diphtérie",
    date: "1985-10-27"
  },
  {
    patient: chris,
    vaccin: "tétanos",
    date: "1986-02-27"
  },
  {
    patient: chris,
    vaccin: "poliomyélite",
    date: "1986-03-13"
  },
  {
    patient: chris,
    vaccin: "fièvre jaune",
    date: "2010-09-05"
  }

]

Vaccination.create!(vaccination_attributes)

allergy_attributes = [  {
    patient: chris,
    name: "accarien"
  },
  {
    patient: chris,
    name: "pollen"
  },
  {
    patient: chris,
    name: "taille"
  },
  {
    patient: chris,
    name: "taille"
  }

]

Allergy.create!(allergy_attributes)

antecedent_attributes = [
    {
    patient: chris,
    description: "pollen"
  },
  {
    patient: chris,
    description: "poils de chatte"
  }

]

Antecedent.create!(antecedent_attributes)




puts 'Creating episodes...'
episode_attributes = [
  {
    patient: chris,
    name: "Rhume decembre 2016"
  },
  {
    patient: chris,
    name: "Ma santé 0-10 ans"
  },
  {
    patient: chris,
    name: "Ma santé 10-20 ans"
  },
  {
    patient: chris,
    name: "Souffle au coeur",
    description: "J'ai une sensation d'épuisement. Je me sens fatigué tout le temps et je suis essouflé pour rien."
  },
  {
    patient: chris,
    name: "Entorse cheville 2016"
  },
  {
    patient: chris,
    name: "Rage de dents 2017"
  },
  {
    patient: chris,
    name: "Allergies Printemps 2016"
  },
  {
    patient: chris,
    name: "Grippe 2016"
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
    speciality: "Medecin généraliste",
    photo: File.open(Rails.root.join('db/fixtures/images/doctor-green.png')),
    patient: chris
  },
  {
    firstname: "Peter",
    lastname: "Benton",
    address: "3 Place Emile Sarradin, 44300 Nantes",
    phone_number: "02 40 20 03 52",
    mail: "peter.benton@gmail.com",
    speciality: "Radiologue",
    photo: File.open(Rails.root.join('db/fixtures/images/doctor-green.png')),
    patient: chris
  },
  {
    firstname: "John",
    lastname: "Carter",
    address: " 8 Rue Marie Anne du Boccage, 44000 Nantes",
    phone_number: "02 40 69 13 13",
    mail: "john.carter@gmail.com",
    speciality: "Dentiste",
    photo: File.open(Rails.root.join('db/fixtures/images/doctor-green.png')),
    patient: chris
  },
  {
    firstname: "Laurent",
    lastname: "Gabai",
    address: " 8 Rue Marie Anne du Boccage, 44000 Nantes",
    phone_number: "02 40 69 13 13",
    mail: "john.carter@gmail.com",
    speciality: "Cardiologue",
    photo: File.open(Rails.root.join('db/fixtures/images/doctor-green.png')),
    patient: chris
  }
]

Caregiver.create!(caregiver_attributes)
puts "Finished!"

event_attributes = [
  {#0
    category: "note",
    description: "Création de l'épisode",
    episode: Episode.first,
    date: "2017-12-03"
  },
  {#1
    category: "note",
    description: "Fièvre et fatigue depuis 4 jours. 1g efferalgan hier et aujourd'hui.",
    episode: Episode.first,
    date: "2017-12-07"
  },
  {#2
    category: "appointment",
    description: "rdv médecin",
    episode: Episode.first,
    date: "2017-12-08",
    caregiver: Caregiver.all[0]
  },
  {#3
    category: "note",
    description: "Création de l'épisode",
    episode: Episode.all[5],
    date: "2017-09-01"
  },
  {#4
    category: "note",
    description: "Train de fièvre et douleur à la tête",
    episode: Episode.all[5],
    date: "2017-08-25"
  },
  {#5
    category: "note",
    description: "Trop mal à la dent!!! J'ai un rdv cet apremidi chez le dentiste. Petite photo-souvenir :(((",
    episode: Episode.all[5],
    date: "2017-09-01"
  },
  {#6
    category: "appointment",
    description: "Abcès. Traitement de l'abcès. Soulagement dès qu'il a percé l'abcès. Amoxicilline et paracétamol/codeine. J'aurais dû venir plus tôt d'après le dentiste...",
    episode: Episode.all[5],
    date: "2017-09-01",
    caregiver: Caregiver.all[2] #dentiste
  },
  {#7
    category: "note",
    description: "Ca va beaucoup mieux. J'ai cru mourrir. J'ai douillé!",
    episode: Episode.all[5],
    date: "2017-09-07"
  },
  {#8
    category: "note",
    description: "Création de l'épisode",
    episode: Episode.all[3],
    date: "2015-03-01"
  },
  {#9
    category: "appointment",
    description: "Visite de routine chez le doc. Je suis assez fatigué en ce moment. Soit c'est la sortie de l'hiver, soit c'est le taff ou peut-etre autre chose. Le dr aimerait que je fasse des examens du coeur car il dit que j'ai un souffle au coeur. Je l'ai depuis longtemps mais il dit qu'il vaut mieux vérifier le coeur tant que je vais bien :). ",
    episode: Episode.all[3],
    date: "2015-03-01",
    caregiver: Caregiver.all[0] #medecin generaliste
  },
  {#10
    category: "appointment",
    description: "ECG et echographie cardiaque chez le cardiologue. J'avais jamais vu mon coeur!",
    episode: Episode.all[3],
    date: "2015-03-10",
    caregiver: Caregiver.all[3] #cardiologue
  },
  {#11
    category: "appointment",
    description: "Radio pour compléter le bilan cardiaque. Pas très bavard le radiologue. J'avais l'impression de le déranger ;)",
    episode: Episode.all[3],
    date: "2015-03-18",
    caregiver: Caregiver.all[1] #radiologue
  },
  {
  category: "appointment",
  description: "Le cardiologue regarde la radio. pas de soucis. C'est un \"souffle fonctionnel\". Ca veut dire que je vais bien, que je fais partie des gens dont le coeur fait des bruits chelous.",
  episode: Episode.all[3],
  date: "2015-03-20",
  caregiver: Caregiver.all[3] #cardiologue
  },
     {
    category: "appointment",
    description: "Je viens montrer les resultats de mes examens du coeur. Tout est cool. ",
    episode: Episode.all[3],
    date: "2015-03-30",
    caregiver: Caregiver.all[0] #medecin generaliste
  }

]

event = Event.create!(event_attributes)


document_attributes = [
  {
    category: "medicament",
    name: "Ma vieille boite d'efferalgan",
    event: Event.all[1],
    document: File.open(Rails.root.join('db/fixtures/images/efferalgan.jpg'))
  },
    {
    category: "photo",
    name: "oh ma bouche",
    event: Event.all[5],
    document: File.open(Rails.root.join('db/fixtures/images/abces-dent.jpg'))
  },
    {
    category: "ordonnance",
    name: "ordo dentiste",
    event: Event.all[6],
    document: File.open(Rails.root.join('db/fixtures/images/ordo-dentiste.jpg'))
  },
    {##########
    category: "radio",
    name: "Radio coeur",
    event: Event.all[11],
    document: File.open(Rails.root.join('db/fixtures/images/radio-coeur.jpg'))
  },
  {
    category: "ECG",
    name: "ECG de mon coeur",
    event: Event.all[10],
    document: File.open(Rails.root.join('db/fixtures/images/ecg.png'))
  },
  {
    category: "echographie",
    name: "Echo de mon coeur",
    event: Event.all[10],
    document: File.open(Rails.root.join('db/fixtures/images/echo-coeur.jpg'))
  },
  {
    category: "ordonnance",
    name: "ordo controle coeur",
    event: Event.all[9],
    document: File.open(Rails.root.join('db/fixtures/images/ordo-controle-coeur.jpg'))
  }

]


Document.create!(document_attributes)



icon_attributes = [
  {
  name: 'anesthesia',
  photo: File.open(Rails.root.join('db/fixtures/images/icons/anesthesia.png'))
  },
  {
 name: 'antibiotic',
 photo: File.open(Rails.root.join('db/fixtures/images/icons/antibiotic.png'))
  },
 {
  name: 'arm-1',
  photo: File.open(Rails.root.join('db/fixtures/images/icons/arm-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/arm.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/articulation.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/bacteria.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/band-aid.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/blood-sample-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/blood-sample.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/blood-transfusion.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/bone.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/braces-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/braces-2.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/braces.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/brain-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/brain-2.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/brain-3.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/brain.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/breast-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/breast-2.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/breast-3.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/breast-4.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/breast-implant.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/breast.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/canine-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/canine-2.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/canine-3.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/canine.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/cardiogram-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/cardiogram-2.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/cardiogram.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/caries-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/caries.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/crutches.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/dental-drill.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/dental-floss.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/dna.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/dropper.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/drugs-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/drugs-2.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/drugs-3.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/drugs-4.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/drugs.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/ear.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/earbuds.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/edema.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/electric-toothbrush.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/epidermis.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/extraction.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/eye-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/eye-drops-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/eye-drops.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/eye.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/fat.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/femur.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/finger-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/finger-2.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/finger.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/first-aid-kit.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/fit.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/gum-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/gum.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/hammer.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/heart.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/implants-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/implants-2.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/implants-3.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/implants-4.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/implants.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/inhalator.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/intestines.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/iris.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/kidney-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/kidney.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/knee-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/knee.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/kneecap.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/liver.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/lozenge.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/lungs-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/lungs-2.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/lungs.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/medical-records.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/medicine-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/medicine.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/microbe.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/mirror.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/molar-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/molar-2.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/molar-3.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/molar-4.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/molar-5.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/molar-6.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/molar-7.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/molar-8.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/molar-crown.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/molar.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/nose.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/notepad.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/ointment-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/ointment.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/optical.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/otoscope.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/pancreas.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/penis.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/perfusion.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/periodontal-scaler-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/periodontal-scaler-2.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/periodontal-scaler.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/pill-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/pill.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/pills-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/pills-2.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/pills-3.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/pills-4.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/pills.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/plastered-foot-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/plastered-foot.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/premolar-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/premolar-2.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/premolar.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/records-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/records-2.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/records.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/ribbon.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/scalpel.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/scissors.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/skeleton.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/skull-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/skull.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/spinal-column.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/stethoscope.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/stomach-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/stomach.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/syringe-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/syringe-2.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/syringe-3.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/syringe-4.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/syringe.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/tablets.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/teeth-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/teeth-10.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/teeth-2.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/teeth-3.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/teeth-4.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/teeth-5.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/teeth-6.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/teeth-7.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/teeth-8.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/teeth-9.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/teeth.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/thermometer-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/thermometer.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/thin.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/tonsils-tester.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/tooth-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/tooth-2.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/tooth-brush.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/tooth-pliers.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/tooth.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/tweezers-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/tweezers.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/uterus.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/vagina-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/vagina.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/virus.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/wheelchair.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/x-ray-1.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/x-ray-2.png'))
  },
 {
  photo: File.open(Rails.root.join('db/fixtures/images/icons/x-ray.png'))
}

]

Icon.create!(icon_attributes)






