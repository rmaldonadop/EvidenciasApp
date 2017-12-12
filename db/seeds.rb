# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

universidades = Universidad.create([{codigo: "UTEM", nombre: "UTEM", direccion: "", casa_matriz: ""}])

facultades = Facultad.create([
	{codigo: "ING", nombre: "Facultad de Ingenieria", direccion: "", decano: "", universidad: universidades.first}, 
	{codigo: "CNC", nombre: "Facultad de Ciencias", direccion: "", decano: "", universidad: universidades.first}]
)

escuelas = Escuela.create([
	{codigo: "INF", nombre: "Escuela de Informatica", director: "", facultad: facultades.first},
	{codigo: "IND", nombre: "Escuela de Industria", director: "", facultad: facultades.first},
	{codigo: "BIO", nombre: "Escuela de Biologia", director: "", facultad: facultades.second}]
)

carreras = Carrera.create([
	{codigo: "ICCI", nombre: "Ing. Civil en Computacion", jefe_carrera: "", escuela: escuelas.first},
	{codigo: "INDT", nombre: "Ing. Civil en Industrial", jefe_carrera: "", escuela: escuelas.second},
	{codigo: "BIOM", nombre: "Biologia Marina", jefe_carrera: "", escuela: escuelas.third}]
)

sellos = Sello.create([
	{codigo: "TEC", tipo: "Tecnologia"},
	{codigo: "CUL", tipo: "Cultura"}]
)

tipo_evs = Evidencetype.create([
	{codigo: "SAT", tipo: "Salida a Terreno"},
	{codigo: "DOC", tipo: "Documento"},
	{codigo: "CTT", tipo: "Contrato"},
	{codigo: "FOT", tipo: "Foto"}]
)

user = Usuario.new
user.nombre = "superuser"
user.rut = "12345678-9"
user.email = "super@user.com"
user.password = "superuser"
user.password_confirmation = "superuser"
user.save!

user2 = Usuario.new
user2.nombre = "usuario"
user2.rut = "98765432-1"
user2.email = "user@user.com"
user2.password = "usuario"
user2.password_confirmation = "usuario"
user2.save!

#1000.times do
#  new_item = Evidence.create({nombre: "item", universidad: universidades.first, usuario: user, sello: sellos.first, evidencetype: tipo_evs.first, created_at: rand(3.years.ago..Time.now)})
#end