FactoryGirl.define do
  factory :list do
    title "test_title"
  end

  factory :to_meet, class: List do
    title "to_meet"
  end

  factory :interview, class: List do
    title "interview"
  end
end