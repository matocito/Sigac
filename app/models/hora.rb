class Hora < ActiveRecord::Base
  validates :dia, :presence => true
  validates :intervalo, :presence => true
  
  belongs_to :horario
  
  def to_s
    intervalo
  end
end
