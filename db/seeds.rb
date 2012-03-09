# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Administrador.create(:email => 'admin@example.com', :password => '123456', 
  :password_confirmation => '123456', :nome => 'Administrador da Silva',
  :nascimento => 30.years.ago, :telefone => '99996137', :cpf => '078085186405')
