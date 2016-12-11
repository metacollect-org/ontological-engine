FactoryGirl.define do
  factory :ontological_category, class: 'Ontological::Category' do
    factory :mona do
      uri 'simpsons:mona'
    end
    factory :abe do
      uri 'simpsons:abe'
    end
    factory :marge do
      uri 'simpsons:marge'
    end
    factory :homer do
      uri 'simpsons:homer'
    end
    factory :bart do
      uri 'simpsons:bart'
    end
    factory :lisa do
      uri 'simpsons:lisa'
    end
    factory :maggie do
      uri 'simpsons:maggie'
    end
  end
end
