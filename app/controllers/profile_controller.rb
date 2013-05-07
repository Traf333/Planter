class ProfileController < ApplicationController

  include TheRole::Requires

  before_filter :login_required
  alias_method :login_required, :authenticate_user!

  after_filter :update_member_logo, :only => [:update_member]

  def me
    @user = current_user
    @errors = @user.errors
  end

  def update_me
    @user = current_user

    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update_attributes(params[:user])
      redirect_to profile_path,
                  notice: t('activerecord.attributes.user.messages.has_been_success_updated')
    else
      render action: "me"
    end
  end

  def member
    current_user.build_member if current_user.member.nil?
    @member = current_user.member
  end

  def update_member
    if current_user.member.nil?
      @member = Member.new(params[:member])
      result = @member.save
    else
      @member = current_user.member
      result = @member.update_attributes(params[:member])
    end

    if result
      redirect_to profile_member_path,
                  notice: t('activerecord.attributes.member.messages.has_been_success_updated')
    else
      render action: "member"
    end
  end

  def catalog
    redirect_to profile_member_path and return if current_user.member.nil?
    @member = current_user.member

    if params[:member_price_id]
      @member_price = MemberPrice.find(params[:member_price_id])
      @plant_prices = @member_price.plant_prices
    else
      @member_price = MemberPrice.new
      @plant_prices = @member.plant_prices
    end

    @plant_prices.insert(0, PlantPrice.new)
  end

  def new_price
    @price = MemberPrice.new
  end

  def save_price
    @price = MemberPrice.new(params[:member_price])
    @price.member_id = current_user.member.id
    @price.save
  end

  def update_plant_price

    if params[:plant_price]
      plant_price = PlantPrice.new(params[:plant_price])
      plant_price.member_id = current_user.member.id
      if plant_price.save
        render :json => {:status => 'ok', :plant_price_id => plant_price.id}
      else
        render :json => {:status => 'error', :errors => plant_price.errors}
      end
    else
      if params[:plant_price_id] and params[:member_price_id]

        @plant_price = PlantPrice.find(params[:plant_price_id])

        @member_price = @plant_price.member_prices.where(:id => params[:member_price_id]).first
        if @member_price.nil?
          @plant_price.member_prices << MemberPrice.find(params[:member_price_id])
          @plant_price.save
        else
          @member_price.plant_prices.delete(@plant_price)
        end

        render :json => {:status => 'ok'}

      end
    end

  end

  def remove_plant_price
    @plant_price = PlantPrice.find(params[:plant_price_id])
    @plant_price.destroy
    render :json => {:status => 'ok'}
  end

  def remove_member_price
    @member_price = MemberPrice.find(params[:id])
    @member_price.destroy

    redirect_to :action => :catalog
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
