class AddSerieToTurma < ActiveRecord::Migration
  def self.up
    add_column :turmas, :serie_id, :integer
  end

  def self.down
    remove_column :turmas, :serie_id
  end
end
