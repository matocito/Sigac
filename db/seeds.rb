#encoding: UTF-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

a = Administrador.create!(:email => 'admin2@example.com', :password => '123456', 
  :password_confirmation => '123456', :nome => 'Administrador da Silva',
  :nascimento => 30.years.ago, :telefone => '99996137', :cpf => '21746069414')

dias       = %w(Segunda-Feira Terça-Feira Quarta-Feira Quinta-Feira Sexta-Feira)
intervalos = ['13:00 - 13:50', '13:50 - 14:40', '14:40 - 15:30', '15:30 - 16:00',
'16:00 - 16:50', '16:50 - 17:40']

dias.each do |dia|
  intervalos.each do |intervalo|
    Hora.create!(:dia => dia, :intervalo => intervalo)
  end
end

