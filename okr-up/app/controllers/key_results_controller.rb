class KeyResultsController < ApplicationController
  before_action :set_key_result, only: [:edit, :update, :destroy]

  # GET /key_results/new
  def new
    @key_result = KeyResult.new

    if params[:objective]
      @key_result.objective = Objective.find(params[:objective])
    end
  end

  # GET /key_results/1/edit
  def edit
  end

  # POST /key_results
  # POST /key_results.json
  def create
    @key_result = KeyResult.new(key_result_params)
    objective = @key_result.objective

    respond_to do |format|
      if @key_result.save
        format.html { redirect_to objective, notice: 'Key result was successfully created.' }
        format.json { render :show, status: :created, location: @key_result }
      else
        format.html { render :new }
        format.json { render json: @key_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /key_results/1
  # PATCH/PUT /key_results/1.json
  def update
    objective = @key_result.objective

    respond_to do |format|
      if @key_result.update(key_result_params)
        format.html { redirect_to objective, notice: 'Key result was successfully updated.' }
        format.json { render :show, status: :ok, location: @key_result }
      else
        format.html { render :edit }
        format.json { render json: @key_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /key_results/1
  # DELETE /key_results/1.json
  def destroy
    objective = @key_result.objective
    @key_result.destroy

    respond_to do |format|
      format.html { redirect_to objective, notice: 'Key result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_key_result
      @key_result = KeyResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def key_result_params
      params.require(:key_result).permit(:description, :objective_id)
    end
end
