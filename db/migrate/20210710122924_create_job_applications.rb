class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.references :job_ad, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :email
      t.string :phone
      t.string :address
      t.integer :qualification

      t.timestamps
    end
  end
end
