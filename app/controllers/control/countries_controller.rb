module Control
  class CountriesController < ControlPanelController
    # GET /countries
    # GET /countries.json
    def index
      @countries = Country.order("#{sort_column} #{sort_direction}").paginate(:page => params[:page])

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @countries }
      end
    end

    # GET /countries/1
    # GET /countries/1.json
    def show
      @country = Country.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @country }
      end
    end

    # GET /countries/new
    # GET /countries/new.json
    def new
      @country = Country.new

      respond_to do |format|
        format.html { render :layout => !request.xhr? } # new.html.erb
        format.json { render json: @country }
      end
    end

    # GET /countries/1/edit
    def edit
      @country = Country.find(params[:id])
    end

    # POST /countries
    # POST /countries.json
    def create
      @country = Country.new(params[:country])

      respond_to do |format|
        if @country.save
          format.html { redirect_to control_countries_path,
                                    notice: t('activerecord.attributes.country.messages.has_been_success_created') }
          format.json { render json: @country, status: :created, location: @country }
        else
          format.html { render action: "new" }
          format.json { render json: @country.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /countries/1
    # PUT /countries/1.json
    def update
      @country = Country.find(params[:id])

      respond_to do |format|
        if @country.update_attributes(params[:country])
          format.html { redirect_to control_countries_path,
                                    notice: t('activerecord.attributes.country.messages.has_been_success_updated') }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @country.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /countries/1
    # DELETE /countries/1.json
    def destroy
      @country = Country.find(params[:id])
      @country.destroy

      respond_to do |format|
        format.html { redirect_to control_countries_url }
        format.json { head :no_content }
      end
    end
  end
end