p "model destruction..."
Pitch.destroy_all
Project.destroy_all
User.destroy_all
p "done!"

p "creating 3 entrepreneur users..."
jeremy =  User.create!(first_name: "jeremy", 
                      last_name:"Miquel",
                      email: "j@j.com",
                      password: "azerty",
                      is_entrepreneur: true )

etienne = User.create!(first_name: "etienne", 
                      last_name:"masson",
                      email: "e@e.com",
                      password: "azerty",
                      is_entrepreneur: true )

eloise =  User.create!(first_name: "eloise", 
                      last_name:"pividori",
                      email: "p@p.com",
                      password: "azerty",
                      is_entrepreneur: true )
p "entrepreneurs created!"

p "creating 1 contributor user..."
mathieu = User.create!(first_name: "mathieu", 
                      last_name:"cartiller",
                      email: "m@m.com",
                      password: "azerty",
                      is_entrepreneur: false )
p "contributor created!"

p "creating 1 project per entrepreneur"
oenoplace = Project.create!(name:"oenoplace",
                            description: "oenoplace is the future of wine trading, we propose a unique market place to estimate wine",
                            user: jeremy)
cryptohelpers =   Project.create!(name:"cryptohelpers",
                            description: "crypto is the new big thing, you can't miss it ask for help the crypto helpers to answer all your questions about crypto.",
                            user: etienne)
pividori =   Project.create!(name:"pividori design",
                            description: "design you personal earing on pividori design, pick you model adjust the shape, the colors and let eloise do her magic!",
                            user: eloise)
p "projects done!"

p "creating 1 pitch per project"
oenoplace_pitch = Pitch.create!(title:"oenoplace pitch by #{jeremy.first_name}",
                            is_publishable: false,
                            project: oenoplace)
cryptohelpers_pitch =   Pitch.create!(title:"cryptohelpers pitch by #{etienne.first_name}",
                            is_publishable: false,
                            project: cryptohelpers)
pividori_pitch =   Pitch.create!(title:"pividori design pitch by #{eloise.first_name}",
                            is_publishable: false,
                            project: pividori)
p "pitch done!"