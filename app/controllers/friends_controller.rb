class FriendsController < ApplicationController
  before_action :authenticate_user!


  def index
    @friends = current_user.friends
  end

  def show
    @friend = Friend.find(params[:id])
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)
    if @friend.save
      redirect_to friends_path, notice:"Friend is Created"
    else
      render :new, status: :unprocessable_entity  
    end
  end

  def edit
    @friend = Friend.find(params[:id])
  end

  def update
    @friend = Friend.find(params[:id])
    if @friend.update(friend_params)
      redirect_to friends_path, notice:"Friend is Updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy

    redirect_to friends_path
  end

  private

  def friend_params
    params.require(:friend).permit(:first_name, :last_name, :email, :phone, :twitter,:user_id)
  end
end
