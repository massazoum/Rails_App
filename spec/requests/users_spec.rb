require 'rails_helper'
RSpec.describe "Users", type: :request do
 describe "GET #index" do
   it "returns http success" do
     get users_path
     expect(response).to have_http_status(:success)
   end

   it "renders the index template" do
     get users_path
     expect(response).to render_template(:index)
   end

   it "includes the correct placeholder text in the response body" do
     get users_path
     expect(response.body).to include("Here is a list of users:")
   end
 end

 describe "GET #show" do
   it "returns http success" do
     user = create(:user) # Assuming you have a User model with FactoryBot
     get user_path(user)
     expect(response).to have_http_status(:success)
   end

   it "renders the show template" do
     user = create(:user) # Assuming you have a User model with FactoryBot
     get user_path(user)
     expect(response).to render_template(:show)
   end

   it "includes the correct placeholder text in the response body" do
     user = create(:user) # Assuming you have a User model with FactoryBot
     get user_path(user)
     expect(response.body).to include("User Details")
   end
 end
end
