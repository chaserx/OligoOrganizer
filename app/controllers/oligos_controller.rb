class OligosController < ApplicationController
  before_filter :login_required, :except => [ :index, :show ]
  def index
    if logged_in?
      @user = current_user
      #@oligos = current_user.oligos.all
      @oligos = current_user.oligos.paginate :page => params[:page], :order => 'updated_at DESC'
      # @posts = Post.paginate_by_board_id @board.id, :page => params[:page], :order => 'updated_at DESC'
    else
      @oligos = Oligo.paginate :page => params[:page], :order => 'updated_at DESC'
      @users = User.all
    end
  end
  
  def show
    @oligo = Oligo.find(params[:id])
  end
  
  def new
    @oligo = Oligo.new
  end
  
  def create
    @oligo = Oligo.new(params[:oligo])
    @oligo = current_user.oligos.create(params[:oligo]) #thanks Leslie Hensley
    if @oligo.save
      flash[:notice] = "Successfully created oligo."
      redirect_to @oligo
    else
      render :action => 'new'
    end
  end
  
  def edit
    @oligo = Oligo.find(params[:id])
  end
  
  def update
    @oligo = Oligo.find(params[:id])
    if @oligo.update_attributes(params[:oligo])
      flash[:notice] = "Successfully updated oligo."
      redirect_to @oligo
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @oligo = Oligo.find(params[:id])
    @oligo.destroy
    flash[:notice] = "Successfully destroyed oligo."
    redirect_to oligos_url
  end
end
