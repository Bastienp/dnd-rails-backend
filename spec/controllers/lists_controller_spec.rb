require 'rails_helper'
require 'rspec_api_documentation/dsl'


RSpec.describe ListsController, type: :controller do
  resource "Lists" do
    route "/lists", "Get Lists" do
      render_views
      header "Accept", "application/json"
      header "Content-Type", "application/json"
      get "GET Lists" do
        context 'with valid params' do
          it 'returns all lists' do
            to_meet = create(:list)
            interview = create(:list)
            do_request()
            expect(response_body).to eq([to_meet, interview].to_json)
            expect(status).to eq(200)
          end
        end
      end
    end
  end
end

