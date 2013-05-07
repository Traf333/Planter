class AddPaperClipToImages < ActiveRecord::Migration
  def change
    add_attachment :images, :picture
  end
end
