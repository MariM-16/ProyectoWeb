class ReportsController < ApplicationController

  # GET /reports or /reports.json
  def index
    @reports=Report.all
  end

  # GET /reports/1 or /reports/1.json
  def show
    @report_r=Report.find((params[:id]))
    @dat=(Ticket.all.where(creation_date:(@report_r.init_date .. @report_r.finish_date)).count())
    @datO=(Ticket.all.where(creation_date:(@report_r.init_date .. @report_r.finish_date)))
    @open=@datO.where(state:'open').count()
    @close=@datO.where(state:'close').count()
    @reopen=@datO.where(state:'reopen').count()
    @expire=(Ticket.all.where(limit_date:('1900-01-01 01:00'..@report_r.act_date)))
    @exp=@expire.all.where(state:'open')
    @performances=Performance.all.group(:executive_id)
  end

  # GET /reports/new
  def new
    @executive=User.all.where(roll_id:2)
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports or /reports.json
  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to report_url(@report), notice: "Report was successfully created." }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1 or /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to report_url(@report), notice: "Report was successfully updated." }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1 or /reports/1.json
  def destroy
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url, notice: "Report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.fetch(:report, {}).permit(:report, :init_date, :finish_date, :act_date, :user_id)
    end
end
