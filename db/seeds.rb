# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dilp = Organizacion.create! nombre: 'D.I.L.P.', url: 'localhost'

snappler = dilp.empresas.create! nombre: 'Snappler', email: 'info@snappler.com', color: '#355869', imagen: File.open(File.join(Rails.root, 'app/assets/images/empresas/snappler.png')), esta_habilitada: false
ferrobaires = dilp.empresas.create! nombre: 'Ferrobaires', email: 'info@ferrobaires.gob.ar', color: '#160222', imagen: File.open(File.join(Rails.root, 'app/assets/images/empresas/ferrobaires.png')), esta_habilitada: false

esteban = snappler.usuarios.create! nombre: 'Esteban Suárez', email: 'estebansuarezbue@gmail.com', password: 'snappler', password_confirmation: 'snappler'
gustavo = ferrobaires.usuarios.create! nombre: 'Gustavo Molinari', email: 'gustavomolinaribue@gmail.com', password: 'ferrobaires', password_confirmation: 'ferrobaires'

dilp.administrador = gustavo
dilp.save!
