class PresentationsController < ApplicationController
  before_action :set_presentation, only: [:show, :edit, :update, :destroy]
  def new
    @presentation = Presentation.new
  end

  def create
    @presentation = Presentation.new( presentation_params )
   # @presentation.avatar_from_url(params[:avatar_url])
    if @presentation.save
      #flash[:presentation_id] = @presentation.id
      flash[:notice] = "Presentation created successfully!"
    else
      flash[:error] = "Presentation not created!"
    end
     redirect_to root_path
  end

  

  def edit
    @presentation = Presentation.find(params[:id])
    # render :nothing => true
  end

  def update

     respond_to do |format|
      if @presentation.update(presentation_params)
        format.html { redirect_to @presentation, notice: 'Presentation was successfully updated.' }
        format.json { render :show, status: :ok, location: @presentation }
      else
        format.html { render :edit }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  def show    
  end
  def index
    puts "successsssssssssssssssssss"
    @presentaions = current_user.presentations
    puts @presentaions.inspect
    
  end
  def destroy
    
    @presentation.destroy

    
     respond_to do |format|
       format.html { redirect_to root_url, notice: 'Presentation was successfully destroyed.' }
       format.json { head :no_content }
     end
  end
  
  private 
  def set_presentation
      @presentation = Presentation.find(params[:id])
    end
    
  def presentation_params
    params.require(:presentation).permit(:user_id, :avatar, :title, :description, :pre_logo)
  end
end
