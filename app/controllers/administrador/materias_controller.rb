class Administrador::MateriasController < ApplicationController
  inherit_resources
  
  actions :all, :except => [:show]
end
