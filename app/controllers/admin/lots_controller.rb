class Admin::LotsController < Admin::BaseController
  before_action :set_admin_lot, only: [:show, :edit, :update, :destroy]
  before_action :set_admin_products, only: [:new, :create, :edit, :show, :index]

  # GET /admin/lots
  def index
    @admin_lots = Lot.all

  end

  # GET /admin/lots/1
  def show
  end

  # GET /admin/lots/new
  def new
    @admin_lot = Lot.new
  end

  # GET /admin/lots/1/edit
  def edit
  end

  # POST /admin/lots
  # POST /admin/lots.json
  def create
    @admin_lot = Lot.new(admin_lot_params)
    respond_to do |format|
      if @admin_lot.save
        format.html { redirect_to [:admin, @admin_lot], notice: 'Lot was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /admin/lots/1
  # PATCH/PUT /admin/lots/1.json
  def update
    respond_to do |format|
      if @admin_lot.update(admin_lot_params)
        format.html { redirect_to [:admin, @admin_lot], notice: 'Lot was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /admin/lots/1
  # DELETE /admin/lots/1.json
  def destroy
    @admin_lot.destroy
    respond_to do |format|
      format.html { redirect_to admin_lots_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_lot
    @admin_lot = Lot.find(params[:id])
  end

  def set_admin_products
    @admin_products = Product.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_lot_params
    params[:lot].permit(:step_time, :step_price, :price, :begin_date, :expire_date, :product_id)
  end
end
