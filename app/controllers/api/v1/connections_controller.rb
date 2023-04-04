class Api::V1::ConnectionsController < ApplicationController
  before_action :set_connections, only: %i[ show edit update destroy ]

  # GET /connections or /connections.json
  def index
    @connections = Connection.all
    render json: @connections
  end

  # GET /connections/1 or /connections/1.json
  def show
    @connections = User.find(params[:id])
    render json: @connections
  end

  # GET /connections/new
  def new
    @connections = Connections.new
  end

  # GET /connections/1/edit
  def edit
  end

  # POST /connections or /connections.json
  def create
    @connections = Connections.new(connection_params)

    respond_to do |format|
      if @connections.save
        format.html { redirect_to connections_url(@connection), notice: "Connection was successfully created." }
        format.json { render :show, status: :created, location: @connections }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @connections.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /connections/1 or /connections/1.json
  def update
    respond_to do |format|
      if @connections.update(connections_params)
        format.html { redirect_to connections_url(@connections), notice: "Connection was successfully updated." }
        format.json { render :show, status: :ok, location: @connections }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @connections.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /connections/1 or /connections/1.json
  def destroy
    @connections.destroy

    respond_to do |format|
      format.html { redirect_to connections_url, notice: "Connection was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_connections
      @connections = Connections.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def connections_params
      params.require(:connections).permit(:type, :tag, :description, :origin)
    end
end
