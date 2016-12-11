require 'rails_helper'

module Ontological
  shared_examples 'a valid category' do
    it 'its Factory is valid' do
      expect(cat).to be_valid
    end

    context 'is invalid when @uri is' do
      it 'missing' do
          cat.uri = nil
          expect(cat).not_to be_valid
      end

      it 'empty' do
          cat.uri = ''
          expect(cat).not_to be_valid
      end

      it 'uppercase' do
          cat.uri.upcase!
          expect(cat).not_to be_valid
      end
    end

    context '@uri uniqueness' do
      it 'record has the given uri' do
        expect(cat.uri).to eq(uri)
      end

      it 'is violated by another model with the same uri' do
        expect(cat).to be_valid
        expect(second).not_to be_valid
      end

      it 'is fulfilled by another model with a different uri' do
        expect(cat).to be_valid
        second.uri = 'snafu'
        expect(second).to be_valid
      end
    end
  end

  shared_examples 'an ActiveRecord with proper CRUD' do
    it 'has no records before creation' do
      expect(Category.count).to eq(0)
    end

    it 'has no translation records before creation' do
      expect(Translation.count).to eq(0)
    end

    it 'has records after creation' do
      cat  # create object
      expect(Category.count).to eq(cat_count)
    end

    it 'has translation records after creation' do
      cat  # create object
      expect(Translation.count).to eq(trans_count)
    end

    it 'has no records after destruction' do
      cat.destroy
      expect(Category.count).to eq(0)
    end

    it 'has no records after destruction' do
      cat.destroy
      expect(Translation.count).to eq(0)
    end
  end

  RSpec.describe Category, type: :model do
    context 'with Lisa' do
      it_behaves_like 'a valid category' do
        let(:cat) { FactoryGirl.create(:lisa) }
        let(:second) { FactoryGirl.build(:lisa) }
        let(:uri) { 'simpsons:lisa' }
      end
    end

    context 'with Bart' do
      it_behaves_like 'a valid category' do
        let(:cat) { FactoryGirl.create(:bart) }
        let(:second) { FactoryGirl.build(:bart) }
        let(:uri) { 'simpsons:bart' }
      end
    end

#    context 'with Lisa in multiple languages' do
#      it_behaves_like 'an ActiveRecord with proper CRUD' do
#        let(:name) { FactoryGirl.build(:lisa) }
#        let(:cat) { FactoryGirl.create(:lisa) }
#        let(:second) { FactoryGirl.build(:lisa) }
#        let(:uri) { 'simpsons:lisa' }
#      end
#    end
  end
end
