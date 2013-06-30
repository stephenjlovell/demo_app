namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    #create an example Admin user.
    admin = User.create!(name: "Example User",
                        email: "example@railstutorial.org",
                        password: "foobar",
                        password_confirmation: "foobar",)
    admin.toggle!(:admin)

    100.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                  email: email,
                  password: password,
                  password_confirmation: password)
    end

    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |u| u.microposts.create!(content: content) }
    end
    
  end
end