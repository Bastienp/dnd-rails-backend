require 'rails_helper'
require 'rspec_api_documentation/dsl'


RSpec.describe ListsController, type: :controller do
  resource "Lists" do
    route "/lists", "Get Lists" do
      header "Accept", "application/json"
      header "Content-Type", "application/json"
      get "GET Lists" do
        context 'with valid params' do
          it 'returns all lists' do
            to_meet = create(:to_meet)
            interview = create(:interview)
            do_request()
            expect(response_body).to eq([to_meet, interview].to_json)
            expect(status).to eq(200)
          end
        end
      end
    end
    route "/lists/:list_id", "Get list" do
      header "Accept", "application/json"
      header "Content-Type", "application/json"
      parameter :list_id, 'ID of list', :required => true
      get "GET List" do
        before(:each) do
          @list = create(:list)
        end
        context 'for existing list' do
          let(:list_id) {@list.id}
          it "returns list" do
            do_request
            expect(response_body).to eq(@list.to_json)
            expect(status).to eq(200)
          end
        end
        context 'for non-existing list' do
          let(:list_id) {@list.id + 1}
          it "returns an error" do
            do_request
            expect(status).to eq(404)
          end
        end
      end
    end
  end
end

