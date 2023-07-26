require 'rails_helper'

RSpec.describe "Posts", type: :request do
 describe "GET #index" do
   it "returns http success" do
     user = create(:user) 
     get user_posts_path(user)
     expect(response).to have_http_status(:success)
   end

   it "renders the index template" do
     user = create(:user) 
     get user_posts_path(user)
     expect(response).to render_template(:index)
   end

   it "includes the correct placeholder text in the response body" do
     user = create(:user) 
     get user_posts_path(user)
     expect(response.body).to include("Here is a list of posts for a given user:")
   end
 end
end
