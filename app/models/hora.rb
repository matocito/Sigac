class Hora < ActiveRecord::Base
  validates :dia, :presence => true
  validates :intervalo, :presence => true
  
  belongs_to :horario
end
