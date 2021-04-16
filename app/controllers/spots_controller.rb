class SpotsController < ApplicationController
  def new
    @spot = Spot.new
    @walkcourse = Walkcourse.new
  end

  def create
    @walkcourse = Walkcourse.find(params[:id])
    @spot = @walkcourse.spots.build

    if @spot.save
      binding.pry
      flash[:success] = 'スポットが登録されました。'
      redirect_to edit_walkcourse_spot_path(@walkcourse, @spot)
    else
      flash.now[:danger] = 'スポットの登録に失敗しました。'
      redirect_to new_walkcourse_path
    end
  end

  def show; end

  def edit
    @walkcourse = Walkcourse.find(params[:walkcourse_id])
    @spot = @walkcourse.spots.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update_attributes(spot_params)
      # 更新に成功したときの処理
      flash[:success] = 'スポットの更新に成功しました。'
      redirect_to edit_walkcourse_spot_path(@walkcourse, @spot)
    else
      flash.now[:danger] = 'スポットの更新に失敗しました。'
      render 'new'
    end
  end

  def destroy; end

  private

  def spot_params
    params.require(:spot).permit(:name, :transit_time, :time_required, :address, :description)
  end
end
