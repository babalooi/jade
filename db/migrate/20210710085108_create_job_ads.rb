class CreateJobAds < ActiveRecord::Migration[5.2]
  def change
    create_table :job_ads do |t|
      t.string :name
      t.text :description
      t.string :company_name
      t.string :company_email
      t.string :category
      t.date :deadline

      t.timestamps
    end
  end
end
