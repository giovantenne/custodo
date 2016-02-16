class PlayersController < ApplicationController
  http_basic_authenticate_with name: ENV['username'], password: ENV['password'], except: [:index, :show]
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @players = Player.all.order('name ASC')
    respond_with(@players)
  end

  def show
    respond_with(@player)
  end

  def new
    @player = Player.new
    respond_with(@player)
  end

  def edit
  end

  def create
    @player = Player.new(player_params)
    @player.save
    redirect_to players_path(admin: true)
  end

  def update
    @player.update(player_params)
    redirect_to players_path(admin: true)
  end

  def destroy
    @player.destroy
    redirect_to players_path(admin: true)
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name)
  end
end
