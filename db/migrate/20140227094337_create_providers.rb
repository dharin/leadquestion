class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :secret_key
      t.string :domain_name
      t.timestamps
    end
  end
end
