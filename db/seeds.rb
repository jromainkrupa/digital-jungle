p "model destruction..."
Workshop.destroy_all
User.destroy_all
p "done!"

jeanro = User.create(
  first_name: "Jean-Romain",
  last_name: "Krupa",
  email: "jkrupa@hotmail.fr",
  password: "azerty",
  admin: true,
  language: "fr",
  is_teacher: true)

samuel = User.create(
  first_name: "Samuel",
  last_name: "Boulery",
  email: "sam@boulery.com",
  password: "azerty",
  admin: true,
  language: "fr",
  is_teacher: true)

