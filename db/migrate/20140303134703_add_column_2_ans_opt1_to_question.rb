class AddColumn2AnsOpt1ToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :ansopt2, :integer
  end
end
