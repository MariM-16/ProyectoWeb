class Api::V1::TicketsController < APIController
  before_action :set_ticket, only: %i[ show edit update destroy ]

  # GET /tickets or /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1 or /tickets/1.json
  def show
    @tickets = Ticket.all
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets or /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    
    if @ticket.save
      render :show, status: :created, location: @ticket 
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
    
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    
    if @ticket.update(ticket_params)
      render :show, status: :ok, location: @ticket 
    else
      render json: @ticket.errors, status: :unprocessable_entity 
    end
    
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @ticket.destroy

    head :no_content
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.fetch(:ticket, {}).permit(:title, :description, :priority, :state, :user_id, :executive_id, )
    end
end
