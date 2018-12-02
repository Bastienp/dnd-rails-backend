require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.describe UsersController, type: :controller do

  resource "Users" do
    route "/users", "Get Users" do
      header "Accept", "application/json"
      header "Content-Type", "application/json"
      get "GET Users" do
        context 'with valid params' do
          it 'returns all users' do
            to_meet = create(:to_meet)
            alan = create(:user,)
            steve = create(:user, firstname: 'steeve', list: to_meet)
            do_request()
            expect(response_body).to eq([alan, steve].to_json)
            expect(status).to eq(200)
          end
        end
      end
    end

    route "/users/:user_id", "Get user" do
      header "Accept", "application/json"
      header "Content-Type", "application/json"
      parameter :user_id, 'ID of user', required: true
      get "GET User" do
        before(:each) do
          @alan = create(:user)
        end
        context 'for existing user' do
          let(:user_id) {@alan.id}
          it "returns user" do
            do_request
            expect(response_body).to eq(@alan.to_json)
            expect(status).to eq(200)
          end
        end
        context 'for non-existing user' do
          let(:user_id) {@alan.id + 1}
          it "returns an error" do
            do_request
            expect(status).to eq(404)
          end
        end
      end
    end

    route "/users/:user_id", "Put user" do
      header "Accept", "application/json"
      header "Content-Type", "application/json"
      parameter :user_id, 'ID of user', :required => true
      parameter :firstname, 'Firstname of the user', scope: :user
      parameter :lastname, 'Lastname of the user', scope: :user
      parameter :list_id, 'id of list (to_meet, interview etc.)', scope: :user

      put "UPDATE User" do
        before(:each) do
          @alan = create(:user)
          @newList = create(:to_meet)
        end
        context 'with valid parameters' do
          let(:user_id) {@alan.id}
          let(:list_id)  { @newList.id }
          let(:request) { { user: { list_id: list_id } } }
          it "returns user" do
            do_request(request)
            expect(JSON.parse(response_body)["list_id"]).to eq(@newList.id)
            expect(status).to eq(200)
          end
        end
        context 'with invalid parameters' do
          let(:user_id) {@alan.id}
          let(:request) { { car: { name: name, brand: brand, year: year } } }
          let(:firstname)  {  }
          let(:request) { { user: { firstname: firstname } } }
          it "returns an error" do
            do_request(request)
            expect(status).to eq(422)
          end
        end
      end
    end

  end
end
