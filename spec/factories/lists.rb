FactoryGirl.define do
  factory :list do
    title "test_title"
    step "test_title"
  end

  factory :to_meet, class: List do
    title "to_meet"
    step "test_title"
  end

  factory :interview, class: List do
    title "interview"
    step "test_title"
  end
end