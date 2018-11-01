class PicksController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :destroy]
  before_action :admin_user, only: [:index, :destroy]

  def new
    @pick = Pick.new
  end

  def create
    @pick = current_user.picks.build(pick_params)
    if @pick.save
      flash[:success] = "指名完了したにょ"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    current_user.picks.find_by(id: params[:id]).destroy
    flash[:success] = "指名を削除したにょ"
    redirect_back(fallback_location: root_url)
  end

  def index
    @picks = Pick.all.paginate(page: params[:page])
  end

  def retrieval
    number = params[:draft][:number]
    @picks = Pick.retrieval(number).paginate(page: params[:page])
    render 'index'
  end

  def show
    @pick = Pick.find(params[:id])
    num = @pick.round
    @picks = Pick.retrieval(num)
  end

  private 
    def pick_params
      params.require(:pick).permit(:round, :title, :name, :remark)
    end
end
