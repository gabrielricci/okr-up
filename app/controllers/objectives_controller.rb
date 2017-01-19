class ObjectivesController < ApplicationController
  before_action :set_objective, only: [:show, :edit, :update, :destroy]

  # GET /objectives
  # GET /objectives.json
  def index
    @objectives = Objective.all
    @root_node = nil

    nodes_data = Hash.new
    nodes_relationships = Hash.new

    @objectives.each do |objective|
      node = {"description" => objective.description, "children" => [], "id" => objective.id}
      nodes_data[objective.id] = node

      if objective.objective_id == nil
        @root = node
      else
        if !nodes_relationships.key?(objective.objective_id)
          nodes_relationships[objective.objective_id] = Array.new
        end

        nodes_relationships[objective.objective_id].push(objective.id)
      end
    end

    parse_orgchart_relationships(@root, nodes_relationships, nodes_data)

    puts @root.to_json
  end

  # GET /objectives/1
  # GET /objectives/1.json
  def show
    @key_results = KeyResult.where(objective_id: @objective.id).all
    @weeks = get_quarter_weeks(@objective.year, @objective.quarter)
    @progresses = Hash.new

    @key_results.each do |key_result|
      @progresses[key_result.id] = Hash.new

      @kr_progresses = WeeklyProgress.where(key_result_id: key_result.id).all
      @kr_progresses.each do |kr_progress|
        @progresses[key_result.id][kr_progress.week] = kr_progress
      end
    end

    puts @progresses
  end

  # GET /objectives/new
  def new
    @objective = Objective.new
  end

  # GET /objectives/1/edit
  def edit
  end

  # POST /objectives
  # POST /objectives.json
  def create
    @objective = Objective.new(objective_params)

    respond_to do |format|
      if @objective.save
        format.html { redirect_to @objective, notice: 'Objective was successfully created.' }
        format.json { render :show, status: :created, location: @objective }
      else
        format.html { render :new }
        format.json { render json: @objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /objectives/1
  # PATCH/PUT /objectives/1.json
  def update
    respond_to do |format|
      if @objective.update(objective_params)
        format.html { redirect_to @objective, notice: 'Objective was successfully updated.' }
        format.json { render :show, status: :ok, location: @objective }
      else
        format.html { render :edit }
        format.json { render json: @objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objectives/1
  # DELETE /objectives/1.json
  def destroy
    @objective.destroy
    respond_to do |format|
      format.html { redirect_to objectives_url, notice: 'Objective was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_objective
      @objective = Objective.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def objective_params
      params.require(:objective).permit(:description, :organization_id, :objective_id, :year, :quarter)
    end

  def parse_orgchart_relationships(node, relationships, nodes)
    if relationships.has_key?(node["id"])
      relationships[node["id"]].each do |child_node|
        child_node = nodes[child_node].clone()
        parse_orgchart_relationships(child_node, relationships, nodes)
        node["children"].push(child_node)
      end
    end
  end

  def get_quarter_weeks(year, quarter)
    weeks = Array.new

    start_month = ((quarter - 1) * 3) + 1
    end_month = start_month + 2
    current_week = Date.new year, start_month, 1

    if current_week.cwday > 1
      current_week = current_week + ((7 - current_week.cwday) + 1)
    end

    loop do
      weeks.push(current_week)
      current_week = current_week + 7

      break if current_week.month > end_month || current_week.year > year
    end

    weeks
  end

end
