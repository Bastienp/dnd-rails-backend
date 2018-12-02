require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.describe UsersPositionsController, type: :controller do

  resource "Users Positions" do

    route "/users_positions", "Put users positions" do
      header "Accept", "application/json"
      header "Content-Type", "application/json"
      parameter :users, 'users to reorder', :required => true

      put "UPDATE Users positions" do
        before(:each) do
          to_meet = create(:to_meet)
          @alan = create(:alan, position: 1)
          @steve = create(:steve, list:to_meet, position: 2)
        end
        context 'with valid parameters' do
          let(:users) {[@alan, @steve]}
          it "returns user re-ordered" do
            @steve.position = 1
            @steve.save
            @alan.position = 2
            @alan.save
            do_request(users: users)
            expect(response_body).to eq([@steve, @alan].to_json)


            expect(status).to eq(200)
          end
        end
      end
    end

  end
end
