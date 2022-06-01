# require 'rails_helper'

# RSpec.describe WinesController, type: :controller do
#   describe "GET index" do
#     it 'returns a successful response' do
#       get :index
#       expect(response).to be_successful  
#     end

#     it 'assigns @wines' do
#       wine = Wine.create(name: "Carmenere")
#       wines = Wine.all
#       get :index
#       expect(assigns(:wines)).to eq([wine])  
#     end

#     it 'renders the index and show template' do
#       get :index
#       expect(response).to render_template('index')  
#     end
#   end
# end

# Genera conflicto con gema Devise. Al comentar esta gema, el error desaparece.

require 'rails_helper'

RSpec.describe WinesController, type: :controller do
  describe "GET /index" do
    it "returns a succesfull response" do
      get :index
      expect(response).to be_successful
    end

    it 'assigns @wines' do
      # wine = Wine.create(name: 'Wine Name', vineyard: "Vine Yard")
      wines = Wine.all
      get :index
      expect(assigns(:wines)).to eq(wines)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET /show/:id" do
    it "renders the show template" do
      wine2 = Wine.create( name: 'Wine Name2')
      get :show, id: wine2.id
      response.should render_template :show 
    end
  end
end
