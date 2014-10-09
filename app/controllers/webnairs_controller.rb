class WebnairsController < ApplicationController
    before_action :set_webnair, only: [:show, :edit, :update, :destroy]
    def new
        @webnair = Webnair.new
    end

    def create
        @webnair = Webnair.new( webnairs_params )

        if params['webnair']['ppt'].nil?
          @webnair.ppt = Presentation.find(params['webnair']['presentation_id']).avatar
            @webnair.presentation_id = Presentation.find(params['webnair']['presentation_id']).id
        end
        respond_to do |format|
            if @webnair.save
                format.html { redirect_to root_path, notice: 'Webanir was successfully created.' }
                format.json { render :new, status: :created, location: @webnair }
            else
                format.html { render :new }
                format.json { render json: @webnair.errors, status: :unprocessable_entity }
            end
        end
        # redirect_to root_path
    end

    def edit
        @webnair = Webnair.find(params[:id])
    end

    def update
        respond_to do |format|
            if @webnair.update(webnairs_params)
                format.html { redirect_to @webnair, notice: 'Webnair was successfully updated.' }
                format.json { render :show, status: :ok, location: @webnair }
            else
                format.html { render :edit }
                format.json { render json: @webnair.errors, status: :unprocessable_entity }
            end
        end
    end

    def show
    end

    def index
    # @webnairs = Webnair.all
    end

    def destroy
        @webnair.destroy
        respond_to do |format|
            format.html { redirect_to root_url, notice: 'Webnair was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    def set_webnair
        @webnair = Webnair.find(params[:id])
    end
    def webnairs_params
        params.require(:webnair).permit(:user_id, :avatar, :presentation_id, :ppt, :title, :description, :choice)
    end

end
