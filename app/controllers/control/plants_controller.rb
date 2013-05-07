module Control
  class PlantsController < ControlPanelController

    after_filter :update_plant_images, :only => [:create, :update]

    # GET /plants
    # GET /plants.json
    def index

      @plants = Plant.order("#{sort_column} #{sort_direction}")
      unless params[:name].blank?
        name_query = "%#{params[:name]}%"
        @plants = @plants.where('name LIKE ? OR lat_name LIKE ?', name_query, name_query)
      end
      unless params[:genu_id].blank?
        @plants = @plants.only_parents.where(:genu_id => params[:genu_id])
      end
      unless params[:plant_category_id].blank?
        @plants = @plants.where(:plant_category_id => params[:plant_category_id])
      end
      @plants = @plants.paginate(:page => params[:page])

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @plants }
      end
    end

    # GET /plants/1
    # GET /plants/1.json
    def show
      @plant = Plant.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @plant }
      end
    end

    # GET /plants/new
    # GET /plants/new.json
    def new
      @plant = Plant.new(:plant_category_id => params[:plant_category_id],
                         :genu_id => params[:genu_id],
                         :plant_id => params[:plant_id])

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @plant }
      end
    end

    # GET /plants/1/edit
    def edit
      @plant = Plant.find(params[:id])
    end

    # POST /plants
    # POST /plants.json
    def create
      @plant = Plant.new(params[:plant])

      respond_to do |format|
        if @plant.save
          format.html { redirect_to control_plants_path,
                                    notice: t('activerecord.attributes.plant.messages.has_been_success_created') }
          format.json { render json: @plant, status: :created, location: @plant }
        else
          format.html { render action: "new" }
          format.json { render json: @plant.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /plants/1
    # PUT /plants/1.json
    def update
      @plant = Plant.find(params[:id])

      respond_to do |format|
        if @plant.update_attributes(params[:plant])
          format.html { redirect_to control_plants_path,
                                    notice: t('activerecord.attributes.plant.messages.has_been_success_updated') }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @plant.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /plants/1
    # DELETE /plants/1.json
    def destroy
      @plant = Plant.find(params[:id])
      @plant.destroy

      respond_to do |format|
        format.html { redirect_to control_plants_path }
        format.json { head :no_content }
      end
    end

    private

    def update_plant_images
      return if params[:images].blank?
      params[:images].each do |image|
        image = Image.find(image.last.to_i)
        image.owner_id = @plant.id
        image.save
      end
    end

  end
end