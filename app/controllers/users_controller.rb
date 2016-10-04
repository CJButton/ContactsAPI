class UsersController < ApplicationController

  def index
    render json: User.all
    #render json: "'a_key' => 'a value'".to_json
    #render text: "I'm in the index action!"

  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    render json: user
    #text: "User destroyed."
  end

  private
  def user_params
    # {"user"=>{"name"=>"Smithee"}, "id"=>"1"}
    params.require(:user).permit(:username)
  end
end
