class ReportsController < ApplicationController
  before_action :set_report, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :redirect_si_user_no_coincide_con_creador_del_post, only: %i[ edit update destroy ]

  before_action only: [:new, :create] do
    authorize_request(["author", "admin"])
   end

   before_action only: [:edit, :update, :destroy] do
    authorize_request(["admin"])
   end

  # GET /reports or /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1 or /reports/1.json
  def show
    @report = Report.find(params[:id])
    @comment = Comment.new
    @comments = @report.comments
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports or /reports.json
  def create
    @report = Report.new(report_params)
    @report.user = current_user #o @post.user_id = current_user.id
    respond_to do |format|
      if @report.save
        format.html { redirect_to report_url(@report), notice: "Noticia Creada" }
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
        format.html { redirect_to report_url(@report), notice: "Noticia Actualizada" }
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
      format.html { redirect_to reports_url, notice: "Noticia Eliminada" }
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
      params.require(:report).permit(:image, :title, :description, :user_id)
    end
    def redirect_si_user_no_coincide_con_creador_del_post
      if current_user.id != @report.user_id
        redirect_to reports_path, notice: "No puedes editar esta Noticia"
      end
    end
end

