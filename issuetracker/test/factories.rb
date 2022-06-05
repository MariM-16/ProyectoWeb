require 'securerandom'

include FactoryBot::Syntax::Methods
FactoryBot.define do
  factory :organizer do
    name { "MyString" }
    address { "MyString" }
    email { "MyString" }
  end

  factory :user do
    first_name { Faker::Name.name }
    last_name { Faker::Name.last_name }
    email { "#{first_name.gsub(/\s+/, "")}.#{last_name.gsub(/\s+/, "")}@gmail.com".downcase }
    phone { rand(10**9..10**10).to_s }
    roll_id {rand(1..4)}

    factory :user_with_tickets do
      transient do
        tickets_count { rand(1..10) }
      end

      after(:create) do |customer, evaluator|
        create_list(:order, evaluator.orders_count, customer: customer)
      end
    end
  end

  factory :ticket do
    title { Faker::Name.title }
    description { Faker::ChuckNorris.fact }
    category { Faker::ChuckNorris.fact }
    creation_date { Faker::Date.between(from: 6.months.ago, to: Date.today) }
    resolution_date { Faker::Date.between(from: 6.months.ago, to: Date.creation_date) }
    limit_date { Faker::Date.between(from: 6.months.ago, to: Date.creation_date) }
    key_resolution { Faker::ChuckNorris.fact }
    tags {Faker::Types.rb_string}


    event_venue { EventVenue.offset(rand(EventVenue.count)).first }

    factory :event_with_ticket_types_and_tickets do
      transient do
        ticket_types_count { rand(1..5) }
      end

      after(:create) do |event, evaluator|
          create_list(:ticket_type_with_tickets, evaluator.ticket_types_count, event: event)
      end
    end
  end

  factory :event_venue do
    name { Faker::WorldCup.stadium }
    address { Faker::Address.street_address }
    capacity { rand(1..7) * 10000 }
  end

  factory :ticket_type do
    price { Faker::Number.within(range: 10..100) * 1000 }
    name { Faker::Lorem.sentence }

    factory :ticket_type_with_tickets do
      transient do
        # Create 1000 to 5000 tickets per event
        tickets_count { rand(1..5)*10 }
      end

      after(:create) do |ticket_type, evaluator|
        create_list(:ticket, evaluator.tickets_count, ticket_type: ticket_type)
      end
    end
  end

  factory :ticket do
    ticket_type
    order { Order.offset(rand(Order.count)).first }
  end

  factory :order do
    #customer
  end
end
