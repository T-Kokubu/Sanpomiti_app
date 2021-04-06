class WalkcoursesController < ApplicationController
  def index
  end

  def new
    @walkcourse = Walkcourse.new
  end

  def create
    @walkcourse = Walkcourse.new(walkcourse_params)

    if @walkcourse.save
      flash[:success] = 'コースが登録されました。'
      redirect_to edit_walkcourse_path(@walkcourse)
    else
      flash.now[:danger] = 'コースの登録に失敗しました。'
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
