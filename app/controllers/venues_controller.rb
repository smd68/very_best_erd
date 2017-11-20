class VenuesController < ApplicationController
  def index
    @venues = Venue.page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@venues.where.not(:location_latitude => nil)) do |venue, marker|
      marker.lat venue.location_latitude
      marker.lng venue.location_longitude
      marker.infowindow "<h5><a href='/venues/#{venue.id}'>#{venue.restaurant_name}</a></h5><small>#{venue.location_formatted_address}</small>"
    end

    render("venues/index.html.erb")
  end

  def show
    @venues_detail = VenuesDetail.new
    @favorite = Favorite.new
    @venue = Venue.find(params[:id])

    render("venues/show.html.erb")
  end

  def new
    @venue = Venue.new

    render("venues/new.html.erb")
  end

  def create
    @venue = Venue.new

    @venue.restaurant_name = params[:restaurant_name]
    @venue.neighborhood = params[:neighborhood]
    @venue.location = params[:location]

    save_status = @venue.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/venues/new", "/create_venue"
        redirect_to("/venues")
      else
        redirect_back(:fallback_location => "/", :notice => "Venue created successfully.")
      end
    else
      render("venues/new.html.erb")
    end
  end

  def edit
    @venue = Venue.find(params[:id])

    render("venues/edit.html.erb")
  end

  def update
    @venue = Venue.find(params[:id])

    @venue.restaurant_name = params[:restaurant_name]
    @venue.neighborhood = params[:neighborhood]
    @venue.location = params[:location]

    save_status = @venue.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/venues/#{@venue.id}/edit", "/update_venue"
        redirect_to("/venues/#{@venue.id}", :notice => "Venue updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Venue updated successfully.")
      end
    else
      render("venues/edit.html.erb")
    end
  end

  def destroy
    @venue = Venue.find(params[:id])

    @venue.destroy

    if URI(request.referer).path == "/venues/#{@venue.id}"
      redirect_to("/", :notice => "Venue deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Venue deleted.")
    end
  end
end
