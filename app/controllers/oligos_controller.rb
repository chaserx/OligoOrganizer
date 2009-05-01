class OligosController < ApplicationController
  def index
    @oligos = Oligo.all
  end
  
  def show
    @oligo = Oligo.find(params[:id])
  end
  
  def new
    @oligo = Oligo.new
  end
  
  def create
    @oligo = Oligo.new(params[:oligo])
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
