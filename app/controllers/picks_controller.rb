class PicksController < ApplicationController
  before_action :set_pick, only: [:show, :edit, :update, :destroy]

  # GET /picks
  # GET /picks.json
  def index
    # @picks = Pick.search(params[:search])
    # @picks = Pick.all
    @q = Pick.ransack(params[:q])
    # @picks = @q.result(distinct: true)
    @groups = Group.all
    @picks = @q.result.includes(:group)
  end

  def search
    @q = Pick.search(search_params)
    # @picks = @q.result(distinct: true)
    @picks = @q.result.include(:group)
  end


  # GET /picks/1
  # GET /picks/1.json
  def show
    @comments = @pick.comments.all
    @comment = @pick.comments.build
  end

  # GET /picks/new
  def new
    @pick = Pick.new
  end

  # GET /picks/1/edit
  def edit
  end

  # POST /picks
  # POST /picks.json
  def create
    @pick = Pick.new(pick_params)

    respond_to do |format|
      if @pick.save
        format.html { redirect_to @pick, notice: 'Pick was successfully created.' }
        format.json { render :show, status: :created, location: @pick }
      else
        format.html { render :new }
        format.json { render json: @pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /picks/1
  # PATCH/PUT /picks/1.json
  def update
    respond_to do |format|
      if @pick.update(pick_params)
        format.html { redirect_to @pick, notice: 'Pick was successfully updated.' }
        format.json { render :show, status: :ok, location: @pick }
      else
        format.html { render :edit }
        format.json { render json: @pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /picks/1
  # DELETE /picks/1.json
  def destroy
    @pick.destroy
    respond_to do |format|
      format.html { redirect_to picks_url, notice: 'Pick was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pick
      @pick = Pick.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pick_params
      params.require(:pick).permit(:group_id, :location, :description, :picture, :address, :feel)
      # params.require(:pick).permit(:group_id, :location, :description, :picture, :address)
    end
    
    def search_params
      params.require(:q).permit!
    end
end
