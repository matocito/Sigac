class Administrador::ProfessoresController < Administrador::AdminController
  inherit_resources
  respond_to :html, :js
end
