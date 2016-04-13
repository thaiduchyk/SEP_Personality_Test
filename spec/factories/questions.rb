require 'faker'

 FactoryGirl.define do
   factory :question, class: Question do
     qst_txt 'Question in model :'
     a 'Variant a'
     b 'Variant b'
   end
 end



#FactoryGirl.define do
# factory :question, class: Question do
#   qst_txt {Faker::Lorem.sentence}
#   a {(Faker::Hipster.word).capitalize!}
#   b {(Faker::Hipster.word).capitalize!}
# end
#end