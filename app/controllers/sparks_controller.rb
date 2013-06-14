class SparksController < ApplicationController

  def index
    @sparklr = SparksPresenter.new(params)
  end

  def edit
    @spark = Spark.find(params[:id])
  end

  def update
    @spark = Spark.find(params[:id])

    if @spark.update_attributes(params[:spark])
      redirect_to "/#{@spark.user.slug}", notice: 'Spark was successfully updated.'
    else
      render action: "edit"
    end
  end

  def update_from_dropbox
    user = User.find_by_slug(params[:user_slug])
    DropboxWorker.perform_async(user.id)
    redirect_to :back, notice: "Your sparks are being updated. Please refresh in a 30 seconds."
  end
end
