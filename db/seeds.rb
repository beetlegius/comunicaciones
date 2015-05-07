# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dilp = Organizacion.create! nombre: 'D.I.L.P.', url: 'localhost'

xaver = dilp.empresas.create! nombre: 'Xaver', email: 'info@xaver.com.ar', color: '#ff0049', imagen: File.open(File.join(Rails.root, 'app/assets/images/empresas/xaver.png')), esta_habilitada: true
snappler = dilp.empresas.create! nombre: 'Snappler', email: 'info@snappler.com', color: '#355869', imagen: File.open(File.join(Rails.root, 'app/assets/images/empresas/snappler.png')), esta_habilitada: false
ferrobaires = dilp.empresas.create! nombre: 'Ferrobaires', email: 'info@ferrobaires.gob.ar', color: '#160222', imagen: File.open(File.join(Rails.root, 'app/assets/images/empresas/ferrobaires.png')), esta_habilitada: false

gustavo = xaver.usuarios.create! nombre: 'Gustavo Molinari', email: 'gustavo.molinari@xaver.com.ar', password: 'xaver', password_confirmation: 'xaver'
xavier = xaver.usuarios.create! nombre: 'Xavier Perera', email: 'xavier.perera@xaver.com.ar', password: 'xaver', password_confirmation: 'xaver'

nicanor = snappler.usuarios.create! nombre: 'Nicanor Perera', email: 'nicanor.perera@snappler.com', password: 'snappler', password_confirmation: 'snappler'
# Usuario.create! nombre: "Gustavo", email: "a", password: "123456", password_confirmation: "123456", rol: Usuario::SUPERADMIN

madera = ferrobaires.usuarios.create! nombre: 'Nestor Madera', email: 'nestor.madera@ferrobaires.gob.ar', password: 'ferrobaires', password_confirmation: 'ferrobaires'

dilp.administrador = gustavo
dilp.save!