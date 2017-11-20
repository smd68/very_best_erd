class FoodCategoriesController < ApplicationController
  def index
    @q = FoodCategory.ransack(params[:q])
    @food_categories = @q.result(:distinct => true).includes(:dishes).page(params[:page]).per(10)

    render("food_categories/index.html.erb")
  end

  def show
    @dish_detail = DishDetail.new
    @food_category = FoodCategory.find(params[:id])

    render("food_categories/show.html.erb")
  end

  def new
    @food_category = FoodCategory.new

    render("food_categories/new.html.erb")
  end

  def create
    @food_category = FoodCategory.new

    @food_category.category_name = params[:category_name]

    save_status = @food_category.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/food_categories/new", "/create_food_category"
        redirect_to("/food_categories")
      else
        redirect_back(:fallback_location => "/", :notice => "Food category created successfully.")
      end
    else
      render("food_categories/new.html.erb")
    end
  end

  def edit
    @food_category = FoodCategory.find(params[:id])

    render("food_categories/edit.html.erb")
  end

  def update
    @food_category = FoodCategory.find(params[:id])

    @food_category.category_name = params[:category_name]

    save_status = @food_category.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/food_categories/#{@food_category.id}/edit", "/update_food_category"
        redirect_to("/food_categories/#{@food_category.id}", :notice => "Food category updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Food category updated successfully.")
      end
    else
      render("food_categories/edit.html.erb")
    end
  end

  def destroy
    @food_category = FoodCategory.find(params[:id])

    @food_category.destroy

    if URI(request.referer).path == "/food_categories/#{@food_category.id}"
      redirect_to("/", :notice => "Food category deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Food category deleted.")
    end
  end
end
