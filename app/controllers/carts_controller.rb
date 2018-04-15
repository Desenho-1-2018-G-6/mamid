class CartsController < ApplicationController
  before_action :set_cart, only: [:update, :show, :destroy]
  # GET /carts/1
  # GET /carts/1.json
  def show
      if(@cart == nil)
        @cart = Cart.create(totalPrice: 23)
      else
        @cart
      end
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @cart.update(totalPrice: 40)
        format.html { redirect_to(:action => :show)}
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :show }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @cart.update(totalPrice: 0.0)
      redirect_to(:action => :show)
    else
      render json: @cart.errors
    end
  end

  private
    # # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:totalPrice)
    end
end