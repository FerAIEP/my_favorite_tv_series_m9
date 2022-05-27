class EpisodesController < ApplicationController
  def create
    @tv_show = TvShow.find(params[:tv_show_id])
    @episode = @tv_show.episodes.create(episode_params)
    redirect_to tv_show_path(@tv_show)
  end

  private
  def episode_params
      params.require(:episode).permit(:episode_number, :title, :summary)
  end
end
