return if Rails.env.production?

p "model destruction..."
Workshop.destroy_all
User.destroy_all
p "done!"

jeanro = User.create!(
  first_name: "Jean-Romain",
  last_name: "Krupa",
  email: "jkrupa@hotmail.fr",
  password: "azerty",
  admin: true,
  language: "fr",
  is_teacher: true)

puts "#{jeanro.first_name} created"

samuel = User.create!(
  first_name: "Samuel",
  last_name: "Boulery",
  email: "samuel@boulery.com",
  password: "azerty",
  admin: true,
  language: "fr",
  is_teacher: true)

puts "#{samuel.first_name} created"

workshop_1 = Workshop.create!(
  name: "Comment créer un produit web",
  duration: 7,
  start_date: DateTime.strptime("07/14/2021 9:00", "%m/%d/%Y %H:%M"),
  image_url: "https://images.unsplash.com/photo-1558655146-d09347e92766?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
  capacity: 20,
  address: "20 rue des capucins, 69002 Lyon",
  user: samuel
)
puts "#{workshop_1.name} created"

workshop_2 = Workshop.create!(
  name: "Comment présenter un produit web",
  duration: 7,
  start_date: DateTime.strptime("07/21/2021 9:00", "%m/%d/%Y %H:%M"),
  image_url: "https://images.unsplash.com/photo-1505373877841-8d25f7d46678?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1600&q=80",
  capacity: 20,
  address: "20 rue des capucins, 69002 Lyon",
  user: jeanro
)
puts "#{workshop_2.name} created"

workshop_3 = Workshop.create!(
  name: "Comment préparer un MVP",
  duration: 3,
  start_date: DateTime.strptime("07/28/2021 9:00", "%m/%d/%Y %H:%M"),
  image_url: "https://images.unsplash.com/photo-1552664730-d307ca884978?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1650&q=80",
  capacity: 20,
  address: "20 rue des capucins, 69002 Lyon",
  user: jeanro
)
puts "#{workshop_3.name} created"

ActionText::RichText.create!(
  name:   :body, 
  body:   "<div><strong>UX Research &amp; UX Design</strong></div><div>On vous apprends à défricher, questionner l'utilisateur et faire évoluer votre idée pour construire votre produit sur de bonnes bases.<br><br></div><div><strong>Maquettes et prototypes</strong></div><div>On vous aide à réfléchir, penser et designer votre interface produit.</div>",
  record: workshop_1
)

ActionText::RichText.create!(
  name:   :value_added, 
  body:   "<div>- Des techniques pour questionner et echanger avec ses utilisateurs</div><div>- Des notions sur l'élaboration d'un user flow</div><div>- Une maquette produit (avec Figma)</div><div><br></div>",
  record: workshop_1
)

ActionText::RichText.create!(
  name:   :body, 
  body:   "<div><strong>Apprendre à pitcher</strong></div><div>Parler de son projet fait parti du béaba de l'explorateur de la tech alors on vous apprends comment faire.<br><br></div><div><strong>Landing Page</strong></div><div>Ça y est ? Votre produit est prêt à être présenté à vos utilisateurs ? Pourquoi pas faire un petit site web ?</div>",
  record: workshop_2
)

ActionText::RichText.create!(
  name:   :value_added, 
  body:   "<div>- Des techniques pour présenter son projet avec clarté</div><div>- Des notions sur le wording &amp; le copywriting</div><div>- Une landing page (avec Umso)</div><div><br></div>",
  record: workshop_2
)

ActionText::RichText.create!(
  name:   :body, 
  body:   "<div><strong>Code, low-code ou no-code</strong></div><div>Connaitre et comprendre les différentes possibilités sur le marché pour créer la première version de son produit (minimum viable product).<br><br></div><div><strong>Prioriser ses fonctionnalités</strong></div><div>Comment sélectionner les fonctionnalités essentielles à son produit.<br><br></div><div><strong>Comment bien s'entourer</strong></div><div>Freelance, agence, CTO, Designer, junior, senior... à qui s'adresser pour développer son projet.</div>",
  record: workshop_3
)

ActionText::RichText.create!(
  name:   :value_added, 
  body:   "<div>- Une idée des choix techniques possible en fonction d'un projet</div><div>- Comment éviter les pièges</div><div>- Une roadmap</div><div><br></div>",
  record: workshop_3
)

puts "seeding done !"