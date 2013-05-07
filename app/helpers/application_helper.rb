module ApplicationHelper

  def sort_column
    (params[:sort].present?) ? params[:sort] : 'created_at'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'desc'
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column.to_s == sort_column && sort_direction == 'asc') ? 'desc' : 'asc'
    link_to title, {:sort => column, :direction => direction}
  end

end
