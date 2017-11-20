class DishDetailsController < ApplicationController
  def index
    @dish_details = DishDetail.all

    render("dish_details/index.html.erb")
  end

  def show
    @dish = Dish.new
    @dish_detail = DishDetail.find(params[:id])

    render("dish_details/show.html.erb")
  end

  def new
    @dish_detail = DishDetail.new

    render("dish_details/new.html.erb")
  end

  def create
    @dish_detail = DishDetail.new

    @dish_detail.dish = params[:dish]
    @dish_detail.category_id = params[:category_id]

    save_status = @dish_detail.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/dish_details/new", "/create_dish_detail"
        redirect_to("/dish_details")
      else
        redirect_back(:fallback_location => "/", :notice => "Dish detail created successfully.")
      end
    else
      render("dish_details/new.html.erb")
    end
  end

  def edit
    @dish_detail = DishDetail.find(params[:id])

    render("dish_details/edit.html.erb")
  end

  def update
    @dish_detail = DishDetail.find(params[:id])

    @dish_detail.dish = params[:dish]
    @dish_detail.category_id = params[:category_id]

    save_status = @dish_detail.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/dish_details/#{@dish_detail.id}/edit", "/update_dish_detail"
        redirect_to("/dish_details/#{@dish_detail.id}", :notice => "Dish detail updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Dish detail updated successfully.")
      end
    else
      render("dish_details/edit.html.erb")
    end
  end

  def destroy
    @dish_detail = DishDetail.find(params[:id])

    @dish_detail.destroy

    if URI(request.referer).path == "/dish_details/#{@dish_detail.id}"
      redirect_to("/", :notice => "Dish detail deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Dish detail deleted.")
    end
  end
end
