class PlantsController < ApplicationController
  def index

    respond_to do |format|
      format.html {

        @genus = Genu.order

        unless params[:genu_id].blank?
          @genus = @genus.where(:id => params[:genu_id])
        end

        unless params[:search].blank?
          search_string = "%#{params[:search]}%"
          @genus = @genus.joins(:plants)
          .where('genus.name LIKE ? OR genus.lat_name LIKE ? OR plants.name LIKE ? OR plants.lat_name LIKE ?',
                 search_string, search_string, search_string, search_string)
          .group('genus.id')
        end

        @genus = @genus.paginate(:page => params[:page])

      }
      format.json {

        render json: Plant.all
      }
    end


  end

  def show
    @plant = Plant.find(params[:id])
  end

end
