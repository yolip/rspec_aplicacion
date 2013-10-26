require 'spec_helper'

describe UsersController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should render_template :new
    end
  end

  describe "POST 'create'" do
    let(:user){FactoryGirl.create(:user)}
    context "with valid data" do 
      it "saves record in the database" do
        expect{
          post :create, user: FactoryGirl.attributes_for(:user)
        }.to change(User, :count).by(1)
        end
      it "redirect :show" do
          
            post :create,
            user: FactoryGirl.attributes_for(:user)
           redirect_to redirect_to root_path
      end
    end
    context "with invalid data" do 
      it "doesnt save record in database" do 
        expect{
          post :create,
          user: FactoryGirl.attributes_for(:invalid_user)
        }.to_not change(User, :count).by(1)
      end

      it "renders :new template" do
        post :create,
        user: FactoryGirl.attributes_for(:invalid_user)
        response.should render_template :new
      end
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      user = FactoryGirl.create(:user)
      get 'show',id: user
      response.should be_success
    end
  end
end