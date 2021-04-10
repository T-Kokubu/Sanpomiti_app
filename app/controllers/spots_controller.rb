class SpotsController < ApplicationController
  def new; end

  def create; end

  def show; end

  def edit
    @walkcourse = Walkcourse.find(params[:id])
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update_attributes(spot_params)
      # 更新に成功したときの処理
      flash[:success] = 'スポットの更新に成功しました。'
      redirect_to edit_walkcourse_path(@spot)
    else
      flash.now[:danger] = 'スポットの更新に失敗しました。'
      render 'edit'
    end
  end

  def destroy; end

  private

  def spot_params
    params.require(:spot).permit(:name, :transit_time, :time_required, :address, :description)
  end
end
