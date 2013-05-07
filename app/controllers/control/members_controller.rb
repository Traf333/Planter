module Control
  class MembersController < ControlPanelController

    after_filter :update_member_logo, :only => [:create, :update]

    # GET /members
    # GET /members.json
    def index
      @members = Member.order("#{sort_column} #{sort_direction}").paginate(:page => params[:page])

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @members }
      end
    end

    # GET /members/1
    # GET /members/1.json


    # GET /members/new
    # GET /members/new.json
    def new
      @member = Member.new
      @member.regions.build

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @member }
      end
    end

    # GET /members/1/edit
    def edit
      @member = Member.find(params[:id])
    end

    # POST /members
    # POST /members.json
    def create

      @member = Member.new(params[:member])

      respond_to do |format|
        if @member.save
          format.html { redirect_to control_members_path,
                                    notice: t('activerecord.attributes.member.messages.has_been_success_created') }
          format.json { render json: @member, status: :created, location: @member }
        else
          format.html { render action: "new" }
          format.json { render json: @member.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /members/1
    # PUT /members/1.json
    def update

      @member = Member.find(params[:id])

      respond_to do |format|
        if @member.update_attributes(params[:member])
          format.html { redirect_to control_members_path,
                                    notice: t('activerecord.attributes.member.messages.has_been_success_updated') }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @member.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /members/1
    # DELETE /members/1.json
    def destroy
      @member = Member.find(params[:id])
      @member.destroy

      respond_to do |format|
        format.html { redirect_to control_members_path }
        format.json { head :no_content }
      end
    end

    private

    def update_member_logo
      return if params[:logo_id].blank?

      old_images = Image.where(:owner_id => @member.id)
      old_images.delete_all

      image = Image.find(params[:logo_id])
      image.owner_id = @member.id
      image.save
    end

  end
end