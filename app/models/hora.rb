class Hora < ActiveRecord::Base
  validates :dia, :presence => true
  validates :intervalo, :presence => true
  
  has_many :horarios
  
  def to_s
    intervalo
  end
end
