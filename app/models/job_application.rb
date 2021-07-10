class JobApplication < ApplicationRecord
  belongs_to :job_ad

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :qualification, presence: true

  # regex taken form https://github.com/heartcombo/devise/blob/5d5636f03ac19e8188d99c044d4b5e90124313af/test/rails_app/config/initializers/devise.rb#L102
  validates :email,
    presence: true,
    format: {
      with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$\z/,
      message: 'Email not valid'
    }

  enum qualification: [ :VSS, :'VŠS', :SSS, :NK ]

end
