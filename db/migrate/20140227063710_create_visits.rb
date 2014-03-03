class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string    :ipaddress
      t.datetime  :visit_date
      t.integer   :lead_id

      t.timestamps
    end
  end
end
