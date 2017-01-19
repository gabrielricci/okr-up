class WeeklyProgressesController < ApplicationController
  before_action :set_weekly_progress, only: [:edit, :update]

  # GET /weekly_progresses/new
  def new
    @weekly_progress = WeeklyProgress.new

    if params[:week]
      @weekly_progress.week = params[:week]
    end
    if params[:year]
      @weekly_progress.year = params[:year]
    end
    if params[:key_result]
      @weekly_progress.key_result = KeyResult.find(params[:key_result])
    end
  end

  # GET /weekly_progresses/1/edit
  def edit
  end

  # POST /weekly_progresses
  # POST /weekly_progresses.json
  def create
    @weekly_progress = WeeklyProgress.new(weekly_progress_params)
    objective = @weekly_progress.key_result.objective

    respond_to do |format|
      if @weekly_progress.save
        format.html { redirect_to objective, notice: 'Weekly progress was successfully created.' }
        format.json { render :show, status: :created, location: @weekly_progress }
      else
        format.html { render :new }
        format.json { render json: @weekly_progress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weekly_progresses/1
  # PATCH/PUT /weekly_progresses/1.json
  def update
    objective = @weekly_progress.key_result.objective

    respond_to do |format|
      if @weekly_progress.update(weekly_progress_params)
        format.html { redirect_to objective, notice: 'Weekly progress was successfully updated.' }
        format.json { render :show, status: :ok, location: @weekly_progress }
      else
        format.html { render :edit }
        format.json { render json: @weekly_progress.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weekly_progress
      @weekly_progress = WeeklyProgress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weekly_progress_params
      params.require(:weekly_progress).permit(:key_result_id, :year, :week, :progress)
    end
end
