require 'spec_helper'

describe Hora do
  before do
    @hora = FactoryGirl.create(:hora)
  end
  
  subject { @hora }
  
  it { should validate_presence_of :dia }
  it { should validate_presence_of :intervalo }
  it { should belong_to :horario }
end
