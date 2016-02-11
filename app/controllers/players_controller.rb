class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @players = Player.all.order("name ASC")
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
    respond_with(@player)
  end

  def update
    @player.update(player_params)
    respond_with(@player)
  end

  def destroy
    @player.destroy
    respond_with(@player)
  end

  private
    def set_player
      @player = Player.find(params[:id])
    end

    def player_params
      params.require(:player).permit(:name)
    end
end
