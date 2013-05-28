module Control
  class PlantCategoriesController < ControlPanelController
    # GET /plant_categories
    # GET /plant_categories.json
    def index

      case params[:filter]
        when 'category' then

          @plant_categories = []

          category = PlantCategory.find(params[:id])
          @plant_categories << category
          until category.plant_category_id.nil?
            category = PlantCategory.find(category.plant_category_id)
            @plant_categories << category
          end
          @plant_categories.reverse!

        when 'parent' then
          @plant_categories = PlantCategory.where(:parent_category_id => params[:id])
        else
          @plant_categories = PlantCategory.order("#{sort_column} #{sort_direction}").make_categories_tree_hash
      end

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @plant_categories }
      end

    end

    # GET /plant_categories/1
    # GET /plant_categories/1.json
    def show
      @plant_category = PlantCategory.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @plant_category }
      end
    end

    # GET /plant_categories/new
    # GET /plant_categories/new.json
    def new
      @plant_category = PlantCategory.new(:parent_category_id => params[:parent_category_id])

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @plant_category }
      end
    end

    # GET /plant_categories/1/edit
    def edit
      @plant_category = PlantCategory.find(params[:id])
    end

    # POST /plant_categories
    # POST /plant_categories.json
    def create
      @plant_category = PlantCategory.new(params[:plant_category])

      respond_to do |format|
        if @plant_category.save
          format.html { redirect_to control_plant_categories_path,
                                    notice: t('activerecord.attributes.plant_category.messages.has_been_success_created') }
          format.json { render json: @plant_category, status: :created, location: @plant_category }
        else
          format.html { render action: "new" }
          format.json { render json: @plant_category.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /plant_categories/1
    # PUT /plant_categories/1.json
    def update
      @plant_category = PlantCategory.find(params[:id])

      respond_to do |format|
        if @plant_category.update_attributes(params[:plant_category])
          format.html { redirect_to control_plant_categories_path,
                                    notice: t('activerecord.attributes.plant_category.messages.has_been_success_updated') }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @plant_category.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /plant_categories/1
    # DELETE /plant_categories/1.json
    def destroy
      @plant_category = PlantCategory.find(params[:id])
      @plant_category.destroy

      respond_to do |format|
        format.html { redirect_to control_plant_categories_url }
        format.json { head :no_content }
      end
    end
  end
end
