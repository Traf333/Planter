module Control
  class RegionsController < ControlPanelController

    before_filter :login_required, :except => :index

    # GET /regions
    # GET /regions.json
    def index

      @regions = Region.order("#{sort_column} #{sort_direction}")
      if params[:country_id]
        @regions = @regions.where(:country_id => params[:country_id])
      end
      @regions = @regions.paginate(:page => params[:page])

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @regions }
      end
    end

    # GET /regions/1
    # GET /regions/1.json
    def show
      @region = Region.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @region }
      end
    end

    # GET /regions/new
    # GET /regions/new.json
    def new
      @region = Region.new(:country_id => params[:country_id])

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @region }
      end
    end

    # GET /regions/1/edit
    def edit
      @region = Region.find(params[:id])
    end

    # POST /regions
    # POST /regions.json
    def create
      @region = Region.new(params[:region])

      respond_to do |format|
        if @region.save
          format.html { redirect_to control_regions_path,
                                    notice: t('activerecord.attributes.region.messages.has_been_success_created') }
          format.json { render json: @region, status: :created, location: @region }
        else
          format.html { render action: "new" }
          format.json { render json: @region.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /regions/1
    # PUT /regions/1.json
    def update
      @region = Region.find(params[:id])

      respond_to do |format|
        if @region.update_attributes(params[:region])
          format.html { redirect_to control_regions_path,
                                    notice: t('activerecord.attributes.region.messages.has_been_success_updated') }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @region.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /regions/1
    # DELETE /regions/1.json
    def destroy
      @region = Region.find(params[:id])
      @region.destroy

      respond_to do |format|
        format.html { redirect_to control_regions_url }
        format.json { head :no_content }
      end
    end
  end
end