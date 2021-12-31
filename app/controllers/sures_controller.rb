class SuresController < ApplicationController
  def index
    @sured = Sured.all
    render json: @sured
  end
  def create
    @sured = Sured.create(content: params[:content],idnomber: Sured.count + 1, time: Time.new.strftime("%Y/%m/%d %a %H:%M:%S"))
    render json: @sured
  end
  def destroy
    @sured= Sured.find(params[:id])
    if @sured.destroy
      head :no_content, status: :ok
    else
      render json: @sured.errors, status: :unprocessable_entity
    end
  end
  def update
    @sured = Sured.find_by(idnomber: params[:idnomber])
    if params[:like] == 1
      @sured.increment!(:like, 1)
    else
      @sured.like -=1
      @sured.save
    end
    render json: @sured
  end
end
