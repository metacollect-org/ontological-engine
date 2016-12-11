require 'rails_helper'

module Ontological
  shared_examples 'a valid relationship' do
    it 'its Factory is valid' do
      expect(relation).to be_valid
    end

    it 'has correct subject' do
      expect(relation.subject).to equal(subject)
    end

    it 'has correct object' do
      expect(relation.object).to equal(object)
    end
  end

  RSpec.describe Relationship, type: :model do
    before(:each) do
      @child = FactoryGirl.create(:maggie)
      @parent = FactoryGirl.create(:homer)
      @grandparent = FactoryGirl.create(:mona)
      @child_of = FactoryGirl.create(:ontological_category, uri: 'child of')
      @p2c = FactoryGirl.create(:ontological_relationship,
                                 subject: @child,
                                 predicate: @child_of,
                                 object: @parent)
      @gp2p = FactoryGirl.create(:ontological_relationship,
                                 subject: @parent,
                                 predicate: @child_of,
                                 object: @grandparent)
    end

    it_behaves_like 'a valid relationship' do
      let(:relation) { @p2c }
      let(:subject) { @child }
      let(:object) { @parent }
    end

    it_behaves_like 'a valid relationship' do
      let(:relation) { @gp2p }
      let(:subject) { @parent }
      let(:object) { @grandparent }
    end
  end
end
