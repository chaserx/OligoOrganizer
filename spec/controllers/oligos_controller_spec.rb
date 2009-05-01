require File.dirname(__FILE__) + '/../spec_helper'
 
describe OligosController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Oligo.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Oligo.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Oligo.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(oligo_url(assigns[:oligo]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Oligo.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Oligo.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Oligo.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Oligo.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Oligo.first
    response.should redirect_to(oligo_url(assigns[:oligo]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    oligo = Oligo.first
    delete :destroy, :id => oligo
    response.should redirect_to(oligos_url)
    Oligo.exists?(oligo.id).should be_false
  end
end
