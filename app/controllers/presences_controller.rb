class PresencesController < ApplicationController
  before_filter :authorize
  before_action :set_presence, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @presences = Presence.all
    respond_with(@presences)
  end

  def show
    respond_with(@presence)
  end

  def new
    @presence = Presence.new
    respond_with(@presence)
  end

  def edit
  end

  def create
    @presence = Presence.new(presence_params)
    @presence.save
    # respond_with(@presence)
    redirect_to edit_match_path(@presence.match)
  end

  def update
    @presence.update(presence_params)
    respond_with(@presence)
  end

  def destroy
    @presence.destroy
    # respond_with(@presence)
    redirect_to edit_match_path(@presence.match)
  end

  private

  def set_presence
    @presence = Presence.find(params[:id])
  end

  def presence_params
    params.require(:presence).permit(:player_id, :match_id, :team)
  end
end
