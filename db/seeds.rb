
#Test user names

neivy = User.create(name: "Neivy", email: "test@me.com", password: "1234")
demo = User.create(name: "demo", email: "demo@me.com", password: "1234")

#Test plant names sho

Plant.create(name: "Peace Lily", description: "native to tropical regions of the Americas and southeastern Asia", location: "Inside: Living Room", light_requirement: "Low Light", watering: "Once a week", user_id: neivy.id)
Plant.create(name: "ZZ Plant", description: "It is a tropical perennial plant native to eastern Africa, from southern Kenya to northeastern South Africa", location: "Inside: Living Room", light_requirement: "Low Light", watering: "Once a week", user_id: neivy.id)
Plant.create(name: "Calatheas", description: "Native to the tropical Americas, many of the species are popular as pot plants due to their decorative leaves and, in some species, colorful inflorescences.", location: "Inside: Living Room", light_requirement: "medium to bright indirect light", watering: "One or two weeks", user_id: demo.id)