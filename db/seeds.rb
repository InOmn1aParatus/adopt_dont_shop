Application.destroy_all
Pet.destroy_all
PetApplication.destroy_all
Shelter.destroy_all

#applications

app1 = Application.create!(name: 'Caroline Tan', street: '1234 One St', city: 'Vista', state: 'California', zip_code: 90123, status: 'pending')
app2 = Application.create!(name: 'Ezze Alwfai', street: '2345 Two Ave', city: 'Portland', state: 'Oregon', zip_code: 90234, status: 'pending')
app3 = Application.create!(name: 'Marla Shulz', street: '3456 Three Ln', city: 'Seattle', state: 'Washington', zip_code: 90345, status: 'approved')
app4 = Application.create!(name: 'Matt Kragen', street: '4567 Four Blvd', city: 'Phoenix', state: 'Arizona', zip_code: 90456, status: 'approved')
app5 = Application.create!(name: 'Scott Berecki', street: '5678 Five Rd', city: 'Albuquerque', state: 'New Mexico', zip_code: 90567, status: 'rejected')
app6 = Application.create!(name: 'Sami Peterson', street: '6789 Six Ct', city: 'Reno', state: 'Nevada', zip_code: 90678, status: 'rejected')
app7 = Application.create!(name: 'Taylor Varoglu', street: '7890 Seven Dr', city: 'Sal Lake City', state: 'Utah', zip_code: 90789, status: 'approve')
app8 = Application.create!(name: 'Micheal Abbott', street: '8909 Eight Wy', city: 'Spring', state: 'Texas', zip_code: 90890, status: 'pending')
app9 = Application.create!(name: 'Ozzie Osmonson', street: '9098 Nine Pl', city: 'Boulder', state: 'Colorado', zip_code: 90909, status: 'rejected')
app10 = Application.create!(name: 'Carina Sweets', street: '0987 Ten Pkwy', city: 'Helena', state: 'Montana', zip_code: 90098, status: 'pending')



#shelters

shelter1 = Shelter.create!(
  name: "SD Humane Society",
  city: "San Diego",
  rank: 1,
  foster_program: "true"
)

shelter2 = Shelter.create!(
  name: "Boulder Humane Society",
  city: "Boulder",                        
  rank: 2,
  foster_program: "false"
)

#pets

pet1 = shelter1.pets.create!(
  name: "Rick",
  breed: "Dalmation",
  adoptable: true,
  age: 1
)

pet2 = shelter1.pets.create!(
  name: "Morty",
  breed: "Pug",
  adoptable: true,
  age: 2
)

pet3 = shelter1.pets.create!(
  name: "Floopy",
  breed: "Husky",
  adoptable: true,
  age: 3
)

pet4 = shelter2.pets.create!(
  name: "Shmoopy",
  breed: "Spaniel",
  adoptable: true,
  age: 4
)

pet5 = shelter1.pets.create!(
  name: "Spike",
  breed: "Pitbull",
  adoptable: false,
  age: 5
)

pet6 = shelter1.pets.create!(
  name: "Happy",
  breed: "Chihuahua",
  adoptable: true,
  age: 6
)

pet7 = shelter2.pets.create!(
  name: "Skippy",
  breed: "Bulldog",
  adoptable: true,
  age: 7
)

pet8 = shelter2.pets.create!(
  name: "Spot",
  breed: "Malamute",
  adoptable: true,
  age: 8
)

pet9 = shelter2.pets.create!(
  name: "Loki",
  breed: "Golden Retriever",
  adoptable: true,
  age: 9
)

pet10 = shelter2.pets.create!(
  name: "Thor",
  breed: "Poodle",
  adoptable: false,
  age: 10
)