class OccurancesController < ApplicationController
  def index
    @occurances = Occurance.all
  end

  def new
    @occurance = Occurance.new
  end

  def create
    @occurance = Occurance.new(occurance_params)
    if @occurance.save
      redirect_to @occurance
    else
      redirect_to :root
    end
  end

  def show
    @occurance = Occurance.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def occurance_params
    params.require(:occurance).permit(:event_id, :when, :severity)
  end

end
