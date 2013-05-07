class ControlPanelController < ApplicationController

  layout 'control'

  include TheRole::Requires
  include ApplicationHelper

  before_filter :login_required

  def access_denied
    render :text => 'access_denied: requires an role'
  end

  alias_method :login_required, :authenticate_user!
  alias_method :role_access_denied, :access_denied

end
