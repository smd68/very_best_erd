class VenuesDetailsController < ApplicationController
  def index
    @venues_details = VenuesDetail.all

    render("venues_details/index.html.erb")
  end

  def show
    @venues_detail = VenuesDetail.find(params[:id])

    render("venues_details/show.html.erb")
  end

  def new
    @venues_detail = VenuesDetail.new

    render("venues_details/new.html.erb")
  end

  def create
    @venues_detail = VenuesDetail.new

    @venues_detail.dish_id = params[:dish_id]
    @venues_detail.venue_id = params[:venue_id]

    save_status = @venues_detail.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/venues_details/new", "/create_venues_detail"
        redirect_to("/venues_details")
      else
        redirect_back(:fallback_location => "/", :notice => "Venues detail created successfully.")
      end
    else
      render("venues_details/new.html.erb")
    end
  end

  def edit
    @venues_detail = VenuesDetail.find(params[:id])

    render("venues_details/edit.html.erb")
  end

  def update
    @venues_detail = VenuesDetail.find(params[:id])

    @venues_detail.dish_id = params[:dish_id]
    @venues_detail.venue_id = params[:venue_id]

    save_status = @venues_detail.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/venues_details/#{@venues_detail.id}/edit", "/update_venues_detail"
        redirect_to("/venues_details/#{@venues_detail.id}", :notice => "Venues detail updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Venues detail updated successfully.")
      end
    else
      render("venues_details/edit.html.erb")
    end
  end

  def destroy
    @venues_detail = VenuesDetail.find(params[:id])

    @venues_detail.destroy

    if URI(request.referer).path == "/venues_details/#{@venues_detail.id}"
      redirect_to("/", :notice => "Venues detail deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Venues detail deleted.")
    end
  end
end
