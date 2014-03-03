class CreateOtherUsers < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :username
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :source_url
      t.float  :latitude
      t.float  :longitude
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.integer :provider_id
      t.timestamps
    end
  end
end
