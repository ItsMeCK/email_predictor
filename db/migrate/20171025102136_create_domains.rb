class CreateDomains < ActiveRecord::Migration[5.0]
  def change
    create_table :domains do |t|
      t.string :domain_name
      t.string :email_generator

      t.timestamps
    end
  end
end
