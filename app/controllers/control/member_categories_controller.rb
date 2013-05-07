module Control
  class MemberCategoriesController < ControlPanelController
    # GET /member_categories
    # GET /member_categories.json
    def index
      @member_categories = MemberCategory.order("#{sort_column} #{sort_direction}")

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @member_categories }
      end
    end

    # GET /member_categories/1
    # GET /member_categories/1.json
    def show
      @member_category = MemberCategory.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @member_category }
      end
    end

    # GET /member_categories/new
    # GET /member_categories/new.json
    def new
      @member_category = MemberCategory.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @member_category }
      end
    end

    # GET /member_categories/1/edit
    def edit
      @member_category = MemberCategory.find(params[:id])
    end

    # POST /member_categories
    # POST /member_categories.json
    def create
      @member_category = MemberCategory.new(params[:member_category])

      respond_to do |format|
        if @member_category.save
          format.html { redirect_to control_member_categories_path,
                                    notice: t('activerecord.attributes.member_category.messages.has_been_success_created') }
          format.json { render json: @member_category, status: :created, location: @member_category }
        else
          format.html { render action: "new" }
          format.json { render json: @member_category.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /member_categories/1
    # PUT /member_categories/1.json
    def update
      @member_category = MemberCategory.find(params[:id])

      respond_to do |format|
        if @member_category.update_attributes(params[:member_category])
          format.html { redirect_to control_member_categories_path,
                                    notice: t('activerecord.attributes.member_category.messages.has_been_success_updated') }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @member_category.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /member_categories/1
    # DELETE /member_categories/1.json
    def destroy
      @member_category = MemberCategory.find(params[:id])
      @member_category.destroy

      respond_to do |format|
        format.html { redirect_to control_member_categories_url }
        format.json { head :no_content }
      end
    end
  end
end