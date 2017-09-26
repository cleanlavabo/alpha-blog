class ChangeColumnNameInArticle < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :titlegit, :title if column_exists?(:articles, :titlegit)
  end
end
