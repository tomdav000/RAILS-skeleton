class ModelsController < ApplicationController
	def index
		@models = Model.all()
	end

	def show
		@model = Model.find(params[:id])
	end

	def new
		@model = Model.new
	end

	def create
		@model = Model.create(model_params)
		if @model.save()
			redirect_to root_path
		else
			redirect_to new_model_path()
		end
	end

	def edit
		@model = Model.find(params[:id])
	end

	def update
		@model = Model.find(params[:id])
		if @model.update_attributes(model_params)
			redirect_to model_path(@model)
		else
			redirect_to edit_model_path(@model)
		end
	end

	def destroy
		@model = Model.find(params[:id])
		@model.destroy()
		redirect_to root_path
	end

	private

	def model_params
		params.require(:model).permit(:name)
	end
	
end
