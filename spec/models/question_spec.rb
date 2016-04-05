require 'rails_helper'

RSpec.describe Question, type: :model do

    before(:each) do
      @question = Question.new(qst_txt:'Question question :', a:'Variant a', b:'Variant b')

    end
    
    describe 'validations' do
      context 'with valid parameters' do
        it 'is valid' do
          expect(@question).to be_valid
        end
      end
      context 'with invalid parameters' do
        it 'is invalid then question is blank' do
          @question.qst_txt = ''
          expect(@question).to_not be_valid
        end

        it 'is invalid then question format is incorrect' do
          ['A', 'AA','Aa'].each do |qst_txt|
            @question.qst_txt = qst_txt
            expect(@question).to_not be_valid
          end
        end

        it 'is invalid then answer A is blank' do
          @question.a = ''
          expect(@question).to_not be_valid
        end

        it 'is invalid then answer A format is incorrect' do
          ['A', 'AA'].each do |a|
            @question.a = a
            expect(@question).to_not be_valid
          end
        end
        it 'is invalid then answer B is blank' do
          @question.b = ''
          expect(@question).to_not be_valid
        end
        it 'is invalid then answer B format is incorrect' do
          ['A', 'AA'].each do |b|
            @question.b = b
            expect(@question).to_not be_valid
          end
        end
      end
    end
end
