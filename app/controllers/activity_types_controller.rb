class ActivityTypesController < ApplicationController
  def index
    @all_activities = ActivityType.all
  end
  def create
    activity = ActivityType.new(name: params[:name])
    if activity.save
      render json: {status: {code:200 ,message: :ok}}
    else
      render json: {status: {code:500 ,message: 'Something went wrong'}}
    end
  end
  def destroy
    activity = ActivityType.find(params[:id])
    if activity.destroy
      render json: {status: {code:200 ,message: :ok}}
    else
      render json: {status: {code:500 ,message: 'Something went wrong'}}
    end
  end
  def update
    activity = ActivityType.find(params[:id])
    if activity.update(name: params[:name])
      render json: {status: {code:200 ,message: :ok}}
    else
      render json: {status: {code:500 ,message: 'Something went wrong'}}
    end
  end
  def show
    @activity = ActivityType.find(params[:id])
  end
end
