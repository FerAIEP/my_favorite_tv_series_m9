class ActorsController < ApplicationController
  def new
    @tv_show = TvShow.find(params[:tv_show_id])
    @actor = @tv_show.actors.build
end

def create
    @tv_show = TvShow.find(params[:tv_show_id])
    @actor = @tv_show.actors.create!(actor_params)
    redirect_to @tv_show
end

private

def actor_params
    params.require(:actor).permit(:first_name, :last_name, :age, :image)
end
end
