FactoryBot.define do
    factory :user do 
        email { |n| "test-#{n}@gmail.com"}
        password {"pwd1111"}
    end
end