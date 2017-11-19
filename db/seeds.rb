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
	{codigo: "INF", nombre: "Escuela de Biologia", director: "", facultad: facultades.second}]
)

carreras = Carrera.create([
	{codigo: "ICCI", nombre: "Ing. Civil en Computacion", jefe_carrera: "", escuela: escuelas.first},
	{codigo: "INDT", nombre: "Ing. Civil en Inndustrial", jefe_carrera: "", escuela: escuelas.second},
	{codigo: "BIOM", nombre: "Biologia Marina", jefe_carrera: "", escuela: escuelas.third}]
)

tipo_evs = Evidencetype.create([
	{codigo: "SAT", tipo: "Salida a Terreno"},
	{codigo: "DOC", tipo: "Documento"},
	{codigo: "CTT", tipo: "Contrato"},
	{codigo: "FOT", tipo: "Foto"}]
)
