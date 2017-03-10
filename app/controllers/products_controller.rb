class ProductsController < ApplicationController

  def index
    redirect_to '/products'   
  end
  def products
      # @list = Product.all
      @list = Product.select('products.*,categories.name as category_name').joins(:category)
  end
    def create
 
      @product = Product.create(name: params[:name], description: params[:description],pricing: params[:pricing], category_id: params[:category])
    if @product.errors.any?
      redirect_to '/products/new'
      flash[:message] = @product.errors.full_messages
    else
      redirect_to '/products'  
    end
  end
  def new
    @category = Category.all
    render 'new'
  end
  def show
      # @detail = Product.find(params[:id])  
      @detail = Product.select('products.*,categories.name as category_name').joins(:category).find(params[:id]) 

    end
    def edit
      # @edit = Product.find(params[:id]) 
      @edit = Product.select('products.*, categories.name as category_name').joins(:category).find(params[:id]) 
      @category = Category.all.where.not('id' => @edit.category_id)
  
    end
    def update
   
      @update = Product.update(params[:id].to_i, name: params[:name], description: params[:description], pricing: params[:pricing].to_f, category_id: params[:category])
     
    if @update.errors.any?
      flash[:message] = @update.errors.full_messages
      redirect_to '/products/params[:id]/edit'
    else
      redirect_to '/products'  
    end
    end
    def destroy
      @destroy = Product.find(params[:id]).destroy
      redirect_to '/products'  
    end


end
