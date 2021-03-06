module Control
  class GenusController < ControlPanelController

    # GET /genus
    # GET /genus.json
    def index

      @genus = Genu.order("#{sort_column} #{sort_direction}")
      if params[:category_id]
        @genus = @genus.where(:plant_category_id => params[:category_id])
      end
      @genus = @genus.paginate(:page => params[:page])

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @genus }
      end

    end

    # GET /genus/new
    # GET /genus/new.json
    def new
      @genu = Genu.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @genu }
      end
    end

    # GET /genus/1/edit
    def edit
      @genu = Genu.find(params[:id])
    end

    # POST /genus
    # POST /genus.json
    def create

      @genu = Genu.new(params[:genu])

      respond_to do |format|
        if @genu.save
          format.html { redirect_to control_genus_path,
                                    notice: t('activerecord.attributes.genu.messages.has_been_success_created') }
          format.json { render json: @genu, status: :created, location: @genu }
        else
          format.html { render action: "new" }
          format.json { render json: @genu.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /genus/1
    # PUT /genus/1.json
    def update
      @genu = Genu.find(params[:id])

      respond_to do |format|
        if @genu.update_attributes(params[:genu])
          format.html { redirect_to control_genus_path,
                                    notice: t('activerecord.attributes.genu.messages.has_been_success_updated') }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @genu.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /genus/1
    # DELETE /genus/1.json
    def destroy
      @genu = Genu.find(params[:id])
      @genu.destroy

      respond_to do |format|
        format.html { redirect_to control_genus_path }
        format.json { head :no_content }
      end
    end

  end
end