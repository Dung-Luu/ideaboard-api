class Api::V1::IdeasController < ApplicationController
  
  def index
    # headers['Access-Control-Allow-Origin'] = '*'        
    ideas = Idea.order("created_at DESC")
    render json: ideas.to_json
  end

  def create
    idea = Idea.create(idea_params)
    render json: idea.to_json
  end
  
  def update
    idea = Idea.find(params[:id])
    idea.update_attributes(idea_params)
    render json: idea.to_json
  end

  def destroy
    idea = Idea.find(params[:id])
    if idea.destroy
      head :no_content, status: :ok
    else
      render json: idea.errors, status: :unprocessable_entity
    end
  end

  private
  
  def idea_params
    params.require(:idea).permit(:title, :body)
  end
end
