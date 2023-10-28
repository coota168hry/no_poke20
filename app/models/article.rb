class Article < ApplicationRecord
  def self.getTopArticle()
    query = "
    select id,title,display_date
    from articles
    where del_flg <> '1'
    order by display_date desc
    limit 10 ;
    "
    results = Article.find_by_sql(query)
  end

  def self.getDetailArticle(id)
    query = "
    select id,title,display_date,text
    from articles
    where del_flg <> '1'
    and   id = '#{id}';
    "
    results = Article.find_by_sql(query)
  end
end
