class Administrador::SeriesController < Administrador::AdminController
  inherit_resources
  actions :all, :except => [:show]
  defaults :resource_class => Serie, :collection_name => 'series', :instance_name => 'serie'
end
