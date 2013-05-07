module MembersHelper

  def member_title(member)
    title = member.name
    member.member_categories.each do |c|
      title += ", #{c.name}"
    end
    title
  end

  def categories_string(member)
    categories = ''
    member.member_categories.each do |c|
      categories += " #{c.name},"
    end
    categories.chop
  end

end
