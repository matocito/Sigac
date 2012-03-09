class Administrador::ProfessoresController < Administrador::AdminController
  inherit_resources
  respond_to :html, :js
  autocomplete :professor, :nome
end
