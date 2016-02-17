puts "Seeding ..."
User.create!(
  email: 'admin@admin.com',
  password: '12345678',
  admin: true
)

User.create!(
  email: 'user@user.com',
  password: '12345678',
  admin: false
)

active_campaign = MarketingCampaign.create!(active: true)
inactive_campaign = MarketingCampaign.create!(active: false)

15.times do
  Contact.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    tel_number: Faker::PhoneNumber.phone_number,
    marketing_campaign: active_campaign)
end

5.times do
  Contact.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    tel_number: Faker::PhoneNumber.phone_number,
    marketing_campaign: inactive_campaign)
end

contacts = Contact.all
30.times do
  PhoneCall.create!(
    date: Faker::Date.between(15.days.ago, Date.today),
    length: Random.rand(1..5),
    contact: contacts.sample
  )
end
