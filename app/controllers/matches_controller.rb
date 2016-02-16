class MatchesController < ApplicationController
  http_basic_authenticate_with name: ENV['username'], password: ENV['password'], except: [:index, :show]

  before_action :set_match, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @matches = Match.all.order('played_on DESC')
    respond_with(@matches)
  end

  def show
    respond_with(@match)
  end

  def new
    @match = Match.new
    respond_with(@match)
  end

  def edit
  end

  def create
    @match = Match.new(match_params)
    @match.save
    redirect_to edit_match_path(@match)
  end

  def update
    @match.update(match_params)
    respond_with(@match)
  end

  def destroy
    @match.destroy
    redirect_to matches_path(admin: true)
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:played_on, :white_goals, :black_goals, :played)
  end
end
