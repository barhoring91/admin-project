class LogsController < ApplicationController
  before_action :set_log, only: [:show, :update, :destroy]

  # GET /logs
  # GET /logs.json
  def index
    @logs = Log.all
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
  end


  # POST /logs
  # POST /logs.json
  def create
    log = Log.new(app_key: params[:app_key], admin_user_id: params[:admin_user_id], activity_type_id: params[:activity_type_id])
    if log.save
      render json: {status: {code: 200, message: :ok}}
    else
      render json: {status: {code:500 ,message: 'Something went wrong'}}
    end
  end

  # PATCH/PUT /logs/1
  # PATCH/PUT /logs/1.json
  def update
    #if @log.update(app_key: params[:app_key], admin_user_id: params[:admin_user_id], activity_type_id: params[:activity_type_id])
    if @log.update(params.slice(:app_key, :admin_user_id, :activity_type_id))
      render json: {status: {code: 200, message: :ok}}
    else
      render json: {status: {code:500 ,message: 'Something went wrong'}}
    end

  end

  # DELETE /logs/1
  # DELETE /logs/1.json
  def destroy
    if @log.destroy
      render json: {status: {code: 200, message: :ok}}
    else
      render json: {status: {code:500 ,message: 'Something went wrong'}}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

end
