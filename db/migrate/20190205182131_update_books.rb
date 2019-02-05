class UpdateBooks < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :thumbnail, :string, default: 'https://www.mobileread.com/forums/attachment.php?attachmentid=111264&d=1378642555'
  end
end
