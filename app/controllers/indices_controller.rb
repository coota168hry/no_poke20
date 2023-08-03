class IndicesController < ApplicationController
    #home画面表示
    def top
      #ビュー表示のみのため内容なし。
    end
    #検索機能ホーム画面表示
    def search_home
    end

    #検索機能
    def search_result
      #poke_index(モデル(クラス)).search(メソッド)、検索ワードとソフト名を渡して呼び出し
      #返り値を@search_resultに格納してviewで表示できるようにする
      @keyword = params[:keyword]
      @selected_soft_name = params[:selected_soft_name]
      @search_results = PokeIndex.search(params)
    end
  
    #ランダム表示機ホーム画面表示
    def random_home
    end
    
    #ランダム表示機能
    def random_result
      @selected_generation_names = params[:selected_generation_name]
      @search_results = PokeIndex.random(params[:selected_generation_names])
      puts'-----------'
      @search_results.each do |result|
        puts result
      end
      puts'-----------'
    end
end
