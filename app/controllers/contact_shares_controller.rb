class ContactSharesController < ApplicationController
  def index
    render json: ContactShare.all
    #render json: "'a_key' => 'a value'".to_json
    #render text: "I'm in the index action!"

  end

  def create
    contact_share = ContactShare.new(contact_share_params)
    if contact_share.save
      render json: contact_share
    else
      render(
        json: contact_share.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    contact_share = ContactShare.find(params[:id])
    if contact_share.update(contact_share_params)
      render json: contact_share
    else
      render(
        json: contact_share.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    contact_share = ContactShare.find(params[:id])
    render json: contact_share
  end

  def destroy
    contact_share = ContactShare.find(params[:id])
    contact_share.destroy

    render json: contact_share
    #text: "contact_share destroyed."
  end

  private
  def contact_share_params
    # {"contact_share"=>{"name"=>"Smithee"}, "id"=>"1"}
    params.require(:contact_shares).permit(:contact_id, :user_id)
  end
end
