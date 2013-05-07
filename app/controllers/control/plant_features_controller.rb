module Control
  class PlantFeaturesController < ControlPanelController
    # GET /plant_features
    # GET /plant_features.json
    def index
      @plant_features = PlantFeature.order("#{sort_column} #{sort_direction}")

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @plant_features }
      end
    end

    # GET /plant_features/1
    # GET /plant_features/1.json
    def show
      @plant_feature = PlantFeature.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @plant_feature }
      end
    end

    # GET /plant_features/new
    # GET /plant_features/new.json
    def new
      @plant_feature = PlantFeature.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @plant_feature }
      end
    end

    # GET /plant_features/1/edit
    def edit
      @plant_feature = PlantFeature.find(params[:id])
    end

    # POST /plant_features
    # POST /plant_features.json
    def create
      @plant_feature = PlantFeature.new(params[:plant_feature])

      respond_to do |format|
        if @plant_feature.save
          format.html { redirect_to control_plant_features_path,
                                    notice: t('activerecord.attributes.plant_feature.messages.has_been_success_created') }
          format.json { render json: @plant_feature, status: :created, location: @plant_feature }
        else
          format.html { render action: "new" }
          format.json { render json: @plant_feature.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /plant_features/1
    # PUT /plant_features/1.json
    def update
      @plant_feature = PlantFeature.find(params[:id])

      respond_to do |format|
        if @plant_feature.update_attributes(params[:plant_feature])
          format.html { redirect_to control_plant_features_path,
                                    notice: t('activerecord.attributes.plant_feature.messages.has_been_success_updated') }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @plant_feature.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /plant_features/1
    # DELETE /plant_features/1.json
    def destroy
      @plant_feature = PlantFeature.find(params[:id])
      @plant_feature.destroy

      respond_to do |format|
        format.html { redirect_to control_plant_features_url }
        format.json { head :no_content }
      end
    end
  end
end
