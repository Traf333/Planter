class MembersController < ApplicationController
  def index
    @members = Member.moderated
    @members = @members.where('members.name LIKE ?', "%#{params[:search]}%") unless params[:search].blank?
    unless params[:region_id].blank?
      @members = @members.joins(:regions).where('regions.id = ?', params[:region_id])
      @members = @members.group('members.id')
    end
    @members = @members.paginate(:page => params[:page])
  end

  def show
    @member = Member.moderated.find(params[:id])
    if params[:modal]
      render 'show', :layout => false
    end
  end

end
