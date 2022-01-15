class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @pagy, @products = pagy(Product.all)
    # @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
    @product = Product.friendly.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def download_pdf 

    most_in_stock = Product.all.map { |p| [p.name, p.inventories.sum(:quantity)]}.sort_by { |p| -p[1] }.first(10)
    out_of_stock = Inventory.where(quantity: 0)

    pdf = WickedPdf.new.pdf_from_string(            
      render_to_string(partial: 'report', layout: false, locals: { most_in_stock: most_in_stock, out_of_stock: out_of_stock}))  
    send_data(pdf,                                  
      filename: "inventory-report-#{Time.now.strftime("%Y-%d-%m_%H-%M-%S")}.pdf",                    
      type: 'application/pdf',                      
      disposition: 'attachment')                    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id])
      # redirect_to request.params.merge(id: @product.friendly_id), status: 301 unless @product.friendly_id == params[:id]
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:id, :description, :seller_id, :name, inventories_attributes: [:id, :quantity, :kind, :price, :_destroy])
    end
end
