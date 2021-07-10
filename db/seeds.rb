def create_job
  deadline = Faker::Date.between(from: rand(10..20).days.ago, to: rand(10..20).days.from_now)

  job = JobAd.new(
    name: Faker::Job.title,
    description: Faker::Lorem.paragraph(sentence_count: rand(10..50), random_sentences_to_add: rand(10..50)),
    company_name: Faker::Company.name,
    company_email: Faker::Internet.email,
    category: Faker::Company.industry,
    deadline: deadline,
  )

  if job.valid?
    job.save
  end
end

300.times do
  create_job
end


User.create(
  first_name: 'Jade',
  last_name: 'Doe',
  email: 'jd@jade.jobs',
  password: 'jade:2021'
)
