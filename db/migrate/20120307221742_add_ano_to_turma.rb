class AddAnoToTurma < ActiveRecord::Migration
  def self.up
    add_column :turmas, :ano_id, :integer
  end

  def self.down
    remove_column :turmas, :ano_id
  end
end
