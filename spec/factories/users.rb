FactoryGirl.define do
  factory :user do
    firstname "Alan"
    lastname "Turing"
    job "Boss of bosses"
    position 1
    list
  end

  factory :alan, class: User do
    firstname "Alan"
    lastname "Turing"
    job "Boss of bosses"
    position 2
    list
  end

  factory :steve, class: User do
    firstname "Steve"
    lastname "Jobs"
    job "Vendeur de pommes"
    position 1
    list
  end
end