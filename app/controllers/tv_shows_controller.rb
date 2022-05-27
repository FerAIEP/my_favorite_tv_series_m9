class TvShowsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]
  before_action :set_tv_show, only: %i[ show edit update destroy ]

  # GET /tv_shows or /tv_shows.json
  def index
    @tv_shows = TvShow.all
  end

  # GET /tv_shows/1 or /tv_shows/1.json
  def show
  end

  # GET /tv_shows/new
  def new
    @tv_show = TvShow.new
    2.times { @tv_show.film_locations.build }
  end

  # GET /tv_shows/1/edit
  def edit
  end

  # POST /tv_shows or /tv_shows.json
  def create
    @tv_show = current_user.tv_shows.build(tv_show_params)
    @tv_show.nationality = Nationality.find(params[:tv_show][:nationality_id]) || Nationality.last

    respond_to do |format|
      if @tv_show.save
        format.html { redirect_to tv_show_url(@tv_show), notice: "Tv show was successfully created." }
        format.json { render :show, status: :created, location: @tv_show }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tv_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tv_shows/1 or /tv_shows/1.json
  def update
    respond_to do |format|
      if @tv_show.update(tv_show_params)
        format.html { redirect_to tv_show_url(@tv_show), notice: "Tv show was successfully updated." }
        format.json { render :show, status: :ok, location: @tv_show }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tv_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tv_shows/1 or /tv_shows/1.json
  def destroy
    @tv_show.destroy

    respond_to do |format|
      format.html { redirect_to tv_shows_url, notice: "Tv show was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tv_show
      @tv_show = TvShow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tv_show_params
      params.require(:tv_show).permit(
          :name, 
          :summary, 
          :release_date, 
          :rating, 
          :nationality_id,
          film_locations_attributes: [:id, :name, :indoor],
          genre_ids: []
        )
    end
end
