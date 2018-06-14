class OccurancesController < ApplicationController
  def index
    @occurances = Occurance.all
  end

  def new
    @occurance = Occurance.new
  end

  def create
    unix_time = Date.parse(occurance_params[:at]).to_time.to_i
    occurance_params[:at] = unix_time

    @occurance = Occurance.new(occurance_params)
    @occurance.at = unix_time

    if @occurance.save
      redirect_to :occurances
    else
      render 'new'
    end
  end

  def show
    @occurance = Occurance.find(params[:id])
  end

  def edit
    redirect_to :occurances
  end

  def update
  end

  def destroy
  end

  private
  def occurance_params
    params.require(:occurance).permit(:event_id, :at, :severity)
  end

end
