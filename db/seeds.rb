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
	{codigo: "STB", tipo: "Sustentabilidad"},
	{codigo: "CUL", tipo: "Cultura"}]
)

tipo_evs = Evidencetype.create([
	{codigo: "SAT", tipo: "Salida a Terreno"},
	{codigo: "DOC", tipo: "Documento"},
	{codigo: "CTT", tipo: "Contrato"},
	{codigo: "FOT", tipo: "Foto"}]
)

usuarios = Usuario.create([
	{nombre: "superuser", rut: "12345678-9", email: "super@user.com", password: "superuser", password_confirmation: "superuser", rol_super: true, rol_usuario: false},
	{nombre: "admin", rut: "12345678-0", email: "admin@admin.com", password: "admin1", password_confirmation: "admin1", rol_admin: true, rol_usuario: false},
	{nombre: "usuario", rut: "98765432-1", email: "user@user.com", password: "usuario", password_confirmation: "usuario"}
])

=begin
i = 0
1000.times do
	i = i+1
	codigo_ev = facultades[rand(0..1)].codigo + "_" + escuelas[rand(0..2)].codigo + "_" + carreras[rand(0..2)].codigo + "_" + sellos[rand(0..2)].codigo + "_" + tipo_evs[rand(0..3)].codigo
	nombre_ev = codigo_ev + "_evidencia " + i.to_s
  Evidence.create({codigo: codigo_ev, nombre: nombre_ev, universidad: universidades.first, usuario: usuarios[rand(0..2)], sello: sellos[rand(0..2)], evidencetype: tipo_evs[rand(0..3)], created_at: rand(3.years.ago..Time.now)})
end
=end
