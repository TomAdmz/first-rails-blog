class TagsController < ApplicationController
	def show
  		@tag = Tag.find(params[:id])
	end

	before_filter :require_login, only: [:destroy]

	def index
		@tags = Tag.all
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy

		flash.notice = "Tag '#{@tag.name}' Deleted!"

		redirect_to :back
	end
end
