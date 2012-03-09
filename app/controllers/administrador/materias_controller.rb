class Administrador::MateriasController < Administrador::AdminController
  inherit_resources
  
  actions :all, :except => [:show]
end
